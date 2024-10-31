# model1.py

import pandas as pd
import numpy as np
from sklearn.model_selection import train_test_split
from sklearn.preprocessing import StandardScaler
import statsmodels.api as sm

def train_logistic_regression(data_path):
    # Load and prepare the data
    loan = pd.read_csv(data_path)
    loan.set_index('id', inplace=True)
    loan = loan.drop(loan[loan['home_ownership'] == 'ANY'].index)

    # Prepare features and target variable
    X = loan.drop(columns=['addr_state', 'emp_title', 'loan_status', 'issue_d', 
                           'issue_y', 'issue_m', 'title', 'annual_inc', 
                           'loan_status_grouped', 'grade', 'sub_grade', 'int_rate'])
    y = loan['loan_status_grouped']

    # One-hot encoding of categorical variables
    categorical_columns = ['home_ownership', 'term', 'purpose', 'emp_length']
    X_encoded = pd.get_dummies(X, columns=categorical_columns, dtype=int)
    X_encoded = X_encoded.drop(columns=['home_ownership_MORTGAGE', 
                                         'term_ 36 months', 
                                         'purpose_car', 
                                         'emp_length_0-1 years'])

    # Train-test split
    X_train, X_test, y_train, y_test = train_test_split(X_encoded, y, test_size=0.2, random_state=42)

    # Scaling
    scaler = StandardScaler()
    numerical_columns = X_train.select_dtypes(include=['float64']).columns
    X_train[numerical_columns] = scaler.fit_transform(X_train[numerical_columns])
    X_test[numerical_columns] = scaler.transform(X_test[numerical_columns])

    # Fit logistic regression model
    X_train_with_const = sm.add_constant(X_train)
    logit_model = sm.Logit(y_train, X_train_with_const)
    result = logit_model.fit(maxiter=1000)

    return result, X_test, y_test
