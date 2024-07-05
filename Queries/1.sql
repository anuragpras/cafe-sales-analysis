-- CONVERT DATE (transaction_date) COLUMN TO PROPER DATE FORMAT

SELECT * FROM coffee_shop_sales



UPDATE coffee_shop_sales
SET transaction_date = STR_TO_DATE(transaction_date, '%d-%m-%Y');

DESCRIBE coffee_shop_sales
