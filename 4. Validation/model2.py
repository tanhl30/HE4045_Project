# model2.py

import pandas as pd
from sklearn.model_selection import train_test_split
from sklearn.preprocessing import StandardScaler
from xgboost import XGBRegressor
import joblib  # Import joblib for saving models

def train_xgb_model(cleaned_data_path, original_data_path):
    # Load the cleaned and original datasets
    loan_cleaned = pd.read_csv(cleaned_data_path)
    loan_cleaned.set_index('id', inplace=True)
    
    loan_original = pd.read_csv(original_data_path)
    loan_original.set_index('id', inplace=True)

    # Merge datasets
    loan_updated = loan_original.merge(loan_cleaned.reset_index()[['id', 'predicted_probs']], on='id', how='left')
    loan_updated.set_index('id', inplace=True)
    loan_updated = loan_updated.drop(loan_updated[loan_updated['home_ownership'] == 'ANY'].index)

    # Prepare features and target variable
    X = loan_updated.drop(columns=['addr_state', 'emp_title', 'loan_status', 
                                    'issue_d', 'issue_y', 'issue_m', 
                                    'title', 'loan_status_grouped', 'annual_inc', 
                                    'grade', 'sub_grade', 'int_rate'])
    y = loan_updated['int_rate'] / 100

    # One-hot encoding of categorical variables
    X_encoded = pd.get_dummies(X, columns=['home_ownership', 'term', 'purpose', 'emp_length'])

    # Train-test split
    X_train, X_test, y_train, y_test = train_test_split(X_encoded, y, test_size=0.2, random_state=42)

    # Scaling
    scaler = StandardScaler()
    numerical_columns = X_train.select_dtypes(include=['float64']).columns
    X_train[numerical_columns] = scaler.fit_transform(X_train[numerical_columns])
    X_test[numerical_columns] = scaler.transform(X_test[numerical_columns])

    # Initialize and fit XGBRegressor
    xgb_model = XGBRegressor(objective='reg:squarederror', n_estimators=100, learning_rate=0.1, max_depth=5, random_state=42)
    xgb_model.fit(X_train, y_train)

    # Save the fitted model and scaler
    joblib.dump(xgb_model, 'xgb_model.pkl')
    joblib.dump(scaler, 'xgb_scaler.pkl')

    return xgb_model, X_test, y_test
