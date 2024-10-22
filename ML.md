## General Workflow
1. Data Cleaning (if needed)
2. One-hot encoding and label encoding 
3. Train-test split

```
X_train, X_test, y_train, y_test = train_test_split(X_encoded, y, test_size=0.2, random_state=42)
```



## Additional



### Cross-Validation
### Feature Selection/Dimension Reduction 

- For logistic regression, can use shrinkage method such as LASSO or Ridge Regression 
    - Ridge -> shrinks beta (coefficient of linear model towards 0) 
    - LASSO -> shrinks beta to 0 

## Resources
- Machine Learning Bible Textbook: [An Introduction to Statistical Learning](https://www.statlearning.com/)
- Statquest Logistic Regression [Youtube playlist](https://www.youtube.com/watch?v=yIYKR4sgzI8&list=PLblh5JKOoLUKxzEP5HA2d-Li7IJkHfXSe)
