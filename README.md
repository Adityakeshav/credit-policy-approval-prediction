# Credit Policy Approval Prediction

## Project Overview
This project uses machine learning models to predict whether a loan application will be approved based on various features, including credit policy and FICO score. The goal is to develop a model that can accurately predict credit policy approval, assisting financial institutions in decision-making processes.

## Models Used
- **Random Forest**: A powerful ensemble model used for classification tasks, which was trained to predict credit policy approvals.
- **Decision Tree**: A decision tree model used to classify loan applications based on features like FICO score and interest rate.

## Dataset
The dataset used in this project contains information about loan applications, including:
- `fico`: FICO credit score of the applicant.
- `credit.policy`: Whether the applicant meets the credit policy requirements.
- `purpose`: Purpose of the loan.
- `int.rate`: Interest rate on the loan.
  
Data is preprocessed by handling missing values, converting categorical variables into factors, and splitting the data into training and testing sets.

## Project Workflow

1. **Data Preprocessing**:
   - Load and inspect the dataset.
   - Handle missing values.
   - Convert categorical columns into factors.
   - Split the data into training and testing sets.

2. **Data Visualization**:
   - Visualize the distribution of credit policy approval.
   - Analyze the relationship between FICO scores and credit policy.
   - Examine interest rates for each credit policy approval status.

3. **Model Training & Evaluation**:
   - Train **Random Forest** and **Decision Tree** models on the training data.
   - Evaluate model performance using confusion matrices and accuracy.

4. **Results**:
   - The Random Forest model achieved an accuracy of **98.96%**.
   - The Decision Tree model showed comparable performance.

## How to Run

1. Clone this repository:
   ```bash
   git clone https://github.com/Adityakeshav/credit-policy-approval-prediction.git
