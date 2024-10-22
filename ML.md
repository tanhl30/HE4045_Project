## General Workflow
1. Data Cleaning (if needed)
2. One-hot encoding and label encoding 

```
#Separate numerical and non-numerical columns
ordinal_columns = ['emp_length', 'grade', 'sub_grade']
categorical_columns = ['home_ownership', 'term']
numerical_columns = X.select_dtypes(include=['float64']).columns

# Apply Label Encoding to ordinal columns before splitting
le = LabelEncoder()
for col in ordinal_columns:
    X[col] = le.fit_transform(X[col])

# Apply OneHotEncoding to categorical columns before splitting
X_encoded = pd.get_dummies(X, columns=categorical_columns)
```
3. Train-test split

```
X_train, X_test, y_train, y_test = train_test_split(X_encoded, y, test_size=0.2, random_state=42)
```

## Feature Selection 

For logistic regression, can use shrinkage method such as LASSO or Ridge Regression 

Ridge -> shrinks beta (coefficient of linear model towards 0) 

LASSO -> shrinks beta to 0 