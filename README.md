# Customer Churn Analysis and Prediction

## Project Overview

This project explores customer churn in a telecommunications company using Python, SQL, exploratory data analysis (EDA), and introductory machine learning.

The objective is to identify customer groups associated with higher churn rates and build a baseline classification model to predict whether a customer is likely to leave.

## Business Problem

Customer churn can affect revenue and long-term business growth. By analysing customer behaviour, businesses can identify groups that may need additional attention and investigate potential customer-retention strategies.

This project explores two key questions:

1. Which customer characteristics are associated with higher churn?
2. How effectively can a machine-learning model identify customers who are likely to churn?

## Dataset

- **Dataset:** IBM Telco Customer Churn
- **Source:** [Kaggle — Telco Customer Churn](https://www.kaggle.com/datasets/blastchar/telco-customer-churn)
- **Format:** CSV
- **Target variable:** `Churn`

The dataset includes customer demographics, subscribed services, contract details, account information, and churn status.

## Tools and Technologies

- **Python:** pandas, Matplotlib
- **SQL:** SQLite
- **Machine Learning:** scikit-learn
- **Environment:** Google Colab / Jupyter Notebook
- **Version Control:** Git and GitHub

## Project Workflow

1. Loaded and inspected the customer dataset.
2. Checked missing values and duplicate records.
3. Converted `TotalCharges` to a numeric data type and handled missing values.
4. Performed exploratory data analysis to understand churn patterns.
5. Compared churn rates across contract types and internet service categories.
6. Used SQL queries to aggregate customer data and calculate churn rates.
7. Split the data into training and test sets using an 80:20 ratio.
8. Built a preprocessing pipeline for numerical and categorical features.
9. Trained a Logistic Regression classification model.
10. Evaluated the model using accuracy, precision, and recall.

## Key Findings

- **Overall churn rate:** 26.58% of customers in the cleaned dataset had churned.
- **Contract type:** Month-to-month customers had the highest churn rate at 42.71%, followed by one-year contracts at 11.28% and two-year contracts at 2.85%.
- **Internet service:** Fiber-optic customers had the highest churn rate at 41.89%, compared with 19.00% for DSL customers and 7.43% for customers without internet service.
- **Customer tenure:** Customers who churned had an average tenure of 17.98 months, compared with 37.65 months for customers who stayed.

These findings indicate that churn is associated with contract type, internet service category, and customer tenure. Further investigation would be needed to understand the underlying reasons for these patterns.

## Business Recommendations

Based on the exploratory analysis, potential actions include:

- Investigating retention offers for month-to-month customers.
- Examining pricing, service quality, and support experiences among fiber-optic customers.
- Providing additional onboarding and support to newer customers.
- Evaluating whether churn predictions can help prioritise customer-retention efforts.

These are recommendations based on observed patterns, not measured business outcomes.

## Machine Learning Model

A Logistic Regression classifier was trained using scikit-learn.

### Model Setup

- **Problem type:** Binary classification
- **Target:** Customer churn (`Yes` or `No`)
- **Training set:** 80%
- **Test set:** 20%
- **Preprocessing:** Median imputation and standardisation for numerical features; most-frequent imputation and one-hot encoding for categorical features.

### Confusion Matrix

The confusion matrix on the test dataset is:

```text
[[917 116]
 [160 214]]
```

| | Predicted: Stayed | Predicted: Churned |
|---|---:|---:|
| **Actual: Stayed** | 917 | 116 |
| **Actual: Churned** | 160 | 214 |

- **True negatives (917):** Customers who stayed and were correctly predicted to stay.
- **False positives (116):** Customers predicted to churn who actually stayed.
- **False negatives (160):** Customers who churned but were not identified by the model.
- **True positives (214):** Customers who churned and were correctly identified.

### Why Model Evaluation Matters

A business should not rely on predictions based on accuracy alone. In this project, the model achieved 80.38% accuracy, but it identified only 57.22% of customers who actually churned.

If the company used these predictions for retention campaigns, some customers at risk of leaving could be missed, while other customers might receive unnecessary retention offers. The business should evaluate precision, recall, the confusion matrix, and the costs of different prediction errors before using the model to guide real decisions.


### Evaluation Results

| Metric | Result |
|---|---:|
| Accuracy | 80.38% |
| Precision | 64.85% |
| Recall | 57.22% |

### Interpretation

- **Accuracy — 80.38%:** The model correctly classified approximately 80% of customers in the test set.
- **Precision — 64.85%:** Of the customers predicted to churn, approximately 65% actually churned.
- **Recall — 57.22%:** The model identified approximately 57% of customers who actually churned.

### Conclusion

The Logistic Regression model provides a baseline for customer churn prediction. Its recall indicates that some customers who eventually churned were not identified by the model. Future experiments could compare other classifiers, tune the decision threshold, and assess whether recall can be improved without an unacceptable loss of precision.

## Repository Contents

- `customer_churn_analysis.ipynb` — data inspection, cleaning, exploratory analysis, SQL experiments, and machine learning.
- `churn_analysis.sql` — SQL analysis queries, if maintained as a separate file.
- `images/` — optional charts exported from the notebook.

## Limitations

- The dataset represents a particular telecommunications customer population and may not generalise to other businesses.
- Observed associations do not establish causation.
- Accuracy alone does not fully describe model performance, especially when churn and non-churn cases are unevenly distributed.
- The model has not been established as suitable for real-world deployment.

## Future Improvements

- Compare Logistic Regression with Decision Tree and Random Forest classifiers.
- Use cross-validation and systematic parameter tuning.
- Evaluate class imbalance and different classification thresholds.
- Examine additional evaluation metrics, such as F1-score and ROC-AUC.
- Improve model interpretability and investigate important predictive features.
- Explore deployment through a simple prediction API.

## Learning Objectives

This project provided hands-on practice with Python data analysis, SQL aggregation, exploratory data analysis, data preprocessing, classification, and model evaluation.

## Disclaimer

This is an educational project using a publicly available dataset. It is not affiliated with or endorsed by IBM, Kaggle, or any employer.
