library(tidyverse)
library(caret)
library(ggplot2)
library(broom)
library(dplyr)
library(car)

loan = read.csv('cleaned_loan.csv')

#Data cleanning, remove if using new csv
transform_emp_length <- function(emp_length) {
  case_when(
    emp_length %in% c("< 1 year", "1 year") ~ "0-1 year",
    emp_length %in% c("2 years", "3 years", "4 years", "5 years") ~ "2-5 years",
    emp_length %in% c("6 years", "7 years", "8 years", "9 years", "10 years") ~ "6-10 years",
    emp_length == "10+ years" ~ "> 10 years")}
    
  
#convert data type into categorical 
loan <- loan %>%
  mutate(
    loan_status_grouped = as.factor(loan_status_grouped),
    home_ownership = as.factor(home_ownership),
    term = as.factor(term),
    emp_length = transform_emp_length(emp_length),
    purpose = as.factor(purpose))

numerical_columns <- loan %>%
  dplyr::select(dplyr::where(is.numeric)) %>%
  names()

# Scale only the numerical columns
loan[numerical_columns] <- scale(loan[numerical_columns])

# Split the dataset into training and test sets
X <- loan %>% dplyr::select(-c("loan_status", "loan_status_grouped",
                               "emp_title", "title", "issue_d", "grade","addr_state","sub_grade","annual_inc"
                               ,"funded_amnt","installment","total_pymnt","int_rate"))

y <- loan$loan_status_grouped

set.seed(42)
trainIndex <- createDataPartition(y, p = .8, list = FALSE)
X_train <- X[trainIndex,]
X_test <- X[-trainIndex,]
y_train <- y[trainIndex]
y_test <- y[-trainIndex]


# Logistic regression
logit_model <- glm(y_train ~ .,  data = as.data.frame(X_train), family = binomial)
summary(logit_model)

#check for multicolinearity
vif(logit_model)

#check for conf_matrix
predicted_probs <- predict(logit_model, X_test, type = "response")
threshold <- 0.5
predicted_classes <- ifelse(predicted_probs >= threshold, 1, 0)
conf_matrix <- table(Predicted = predicted_classes, Actual = y_test)
print(conf_matrix)


#second logit model
logit_model_reduced <- glm(y_train ~ delinq_2yrs + dti + emp_length + inq_last_6mths +
                       loan_amnt + pub_rec + purpose + total_acc + acc_now_delinq + log_annual_inc, 
                    data = as.data.frame(X_train), family = binomial)


#optimal threshold search
calculate_conf_matrix <- function(predicted_classes, actual_classes) {
  conf_matrix <- table(factor(predicted_classes, levels = c(0, 1)), factor(actual_classes, levels = c(0, 1)))
  return(conf_matrix)
}

thresholds <- seq(0.1, 0.9, by = 0.05)

# Function to calculate recall
calculate_recall <- function(model, X_test, y_test) {
  predicted_probs <- predict(model, X_test, type = "response")
  recall_values <- sapply(thresholds, function(t) {
    predicted_classes <- ifelse(predicted_probs >= t, 1, 0)
    conf_matrix <- calculate_conf_matrix(predicted_classes, y_test)
    TP <- if (!is.na(conf_matrix[2, 2])) conf_matrix[2, 2] else 0
    FN <- if (!is.na(conf_matrix[1, 2])) conf_matrix[1, 2] else 0
    recall <- TP / (TP + FN)
    return(recall)
  })
  return(recall_values)
}

# Calculate recall for both models
recall_full <- calculate_recall(logit_model, X_test, y_test)
recall_reduced <- calculate_recall(logit_model_reduced, X_test, y_test)

# Create data frame for plotting
recall_df <- data.frame(
  Threshold = thresholds,
  Full_Model = recall_full,
  Reduced_Model = recall_reduced
)

# Plot the recall vs threshold for both models
library(ggplot2)
ggplot(recall_df, aes(x = Threshold)) +
  geom_line(aes(y = Full_Model, color = "Full Model")) +
  geom_line(aes(y = Reduced_Model, color = "Reduced Model")) +
  geom_point(aes(y = Full_Model, color = "Full Model")) +
  geom_point(aes(y = Reduced_Model, color = "Reduced Model")) +
  ggtitle("Recall vs. Threshold Comparison: Full Model vs. Reduced Model") +
  xlab("Decision Threshold") +
  ylab("Recall") +
  theme_minimal() +
  scale_color_manual(name = "Model", values = c("Full Model" = "blue", "Reduced Model" = "red"))
 