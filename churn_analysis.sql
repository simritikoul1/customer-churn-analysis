

-- Customer Churn Analysis
-- Dataset: IBM Telco Customer Churn
-- Expected table name: customers

-- 1. Count customers by contract type
SELECT
    Contract,
    COUNT(*) AS total_customers
FROM customers
GROUP BY Contract
ORDER BY total_customers DESC;


-- 2. Churn rate by contract type
SELECT
    Contract,
    COUNT(*) AS total_customers,
    SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) AS churned_customers,
    ROUND(
        100.0 * SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END)
        / COUNT(*), 2
    ) AS churn_rate_percent
FROM customers
GROUP BY Contract
ORDER BY churn_rate_percent DESC;


-- 3. Churn rate by internet service
SELECT
    InternetService,
    COUNT(*) AS total_customers,
    SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) AS churned_customers,
    ROUND(
        100.0 * SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END)
        / COUNT(*), 2
    ) AS churn_rate_percent
FROM customers
GROUP BY InternetService
ORDER BY churn_rate_percent DESC;


-- 4. Overall customer count and churn rate
SELECT
    COUNT(*) AS total_customers,
    SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) AS churned_customers,
    ROUND(
        100.0 * SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END)
        / COUNT(*), 2
    ) AS overall_churn_rate_percent
FROM customers;


-- 5. Average tenure by churn status
SELECT
    Churn,
    ROUND(AVG(tenure), 2) AS average_tenure_months,
    COUNT(*) AS total_customers
FROM customers
GROUP BY Churn
ORDER BY Churn;