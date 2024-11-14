# Loan Default Prediction using Machine Learning

This repository contains the code and documentation for the project, **Default or Not? Predicting Loan Default using Machine Learning**, conducted for the course HE4045: Quantitative Economics with Data Science at Nanyang Technological University. The project explores the use of machine learning techniques to predict loan defaults on peer-to-peer (P2P) lending platforms using both microeconomic and macroeconomic factors.

## Project Overview

Peer-to-peer lending platforms offer an accessible alternative to traditional banking loans, but they face higher default rates. This project aims to improve the accuracy of default prediction models by incorporating advanced machine learning techniques and economic indicators, providing actionable insights for lenders and policymakers.

## Objectives

1. Identify key microeconomic and macroeconomic factors affecting loan default probability.
2. Develop and test various machine learning models to predict loan default.
3. Compare model performance using a novel True Negative / False Negative (TN/FN) ratio for enhanced risk assessment.

## Data Sources

- **Credit Risk Analysis**: Loan data from LendingClub (Kaggle dataset).
- **Federal Reserve Interest Rate**: Monthly data from the Federal Reserve Bank of St. Louis.
- **US Unemployment Rate**: Monthly state unemployment rates from the US Bureau of Labor Statistics.

## Methodology

1. **Data Preprocessing**: Data cleaning, transformation, and feature engineering, including variable encoding and matching macroeconomic indicators.
2. **Exploratory Data Analysis**: Univariate, bivariate, and correlation analyses to understand data structure and relationships.
3. **Machine Learning Models**:
   - Logistic Regression
   - K-Nearest Neighbors (KNN)
   - Support Vector Machine (SVM)
   - Artificial Neural Network (ANN)
   - Random Forest (RF)
   - XGBoost (XGB)
4. **Threshold Optimization**: Using TN/FN ratio to balance risk and revenue in loan approvals.

## Results

Each model's performance is evaluated based on accuracy, interpretability, and the TN/FN ratio to assess the trade-offs between minimizing missed defaults and maximizing loan approvals. Key variables, such as loan purpose, term, annual income, and debt-to-income ratio, consistently demonstrate high predictive importance.

## Repository Structure

- `data/`: Contains datasets and additional data sources used in the project.
- `notebooks/`: Jupyter notebooks with data preprocessing, EDA, and model training steps.
- `models/`: Scripts for each machine learning model.
- `results/`: Model performance metrics and feature importance analysis.
- `README.md`: Project overview and instructions.

## Installation and Usage

1. Clone the repository: `git clone https://github.com/yourusername/loan-default-prediction.git`
2. Install the required dependencies: `pip install -r requirements.txt`
3. Run the notebooks or model scripts as per your need. For example, to train a logistic regression model, run:
   ```bash
   python models/logistic_regression.py



## How to do version control on this repo

### What is in this repo?
- `loan.csv` is our source data file. Github can only store files less than 100MB so we have to use git-lfs to store the file. It will store the file elsewhere and put a pointer in our repo. 
- `.gitattributes` is the file that tells git to use git-lfs to store the file.
- `main.py` will be our main working file for now 

### Getting started
1. Download Git at https://git-scm.com/downloads
2. Download VScode at https://code.visualstudio.com/download, or you can use your preferred IDE and terminal.
3. Because our source data file is too big, we need to install https://git-lfs.com/. Once it is installed, initialize it at your vscode terminal using `git lfs install`
4. For the first time, you should clone the existing repository to your local machine. On your terminal:

    ```bash
    git clone https://github.com/tanhl30/HE4045_Project.git
    ```

5. Change directory to the project folder and start working:

    ```bash
    cd HE4045_Project
    ```

### Pull, Push & Commit
1. Before starting work or when someone has made changes, sync your local repo with the latest changes from the remote repository:

    ```bash
    git pull origin main
    ```

2. Save your changes (Ctrl+S) after working on your file and stage all updates for commit:

    ```bash
    git add .
    ```

    If you created a new file, you should do this instead:

    ```bash
    git add "your file name"
    ```

3. Commit your changes with a meaningful message explaining what you've done:

    ```bash
    git commit -m "your commit message"
    ```

4. Push your committed changes to the remote repository:

    ```bash
    git push origin main
    ```

### Useful command lines 
1. Use `git status` to check the status of the project file, whether saved or unsaved.
2. Use `git remote` to check the current remote repository.
3. Use `git log` to check all previous commits.
4. Use `cd "your directory"` or `cd ..` to go back to the previous directory.
5. Use `ls` to list the files in the current directory.
6. Use `git  reset "file name"` to undo the staged changes (ie, undo the `git add`)
7. Use `git reset --HEAD~1` to undo the vommit changes (ie, undo the `git commit`) and go back to the previous commit (Be careful, this will delete all the changes you made after the commit)

### Good Resources
1. freecodecamp : https://www.youtube.com/watch?v=RGOj5yH7evk
2. github desktop and some concepts: https://www.youtube.com/watch?v=Oaj3RBIoGFc 
3. Chatgpt is very useful in teaching me haha