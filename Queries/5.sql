-- TOTAL SALES KPI - MOM DIFFERENCE AND MOM GROWTH

SELECT 
    MONTH(transaction_date) AS month, -- no of months
    ROUND(SUM(unit_price * transaction_qty)) AS total_sales, -- total sales column
    (SUM(unit_price * transaction_qty) - LAG(SUM(unit_price * transaction_qty), 1) -- month sales difference
    OVER (ORDER BY MONTH(transaction_date))) / LAG(SUM(unit_price * transaction_qty), 1) 
    OVER (ORDER BY MONTH(transaction_date)) * 100 AS mom_increase_percentage -- percentage
FROM 
    coffee_shop_sales
WHERE 
    MONTH(transaction_date) IN (4, 5) -- for months of April(Previous Month) and May(Current Month)
GROUP BY 
    MONTH(transaction_date)
ORDER BY 
    MONTH(transaction_date);
