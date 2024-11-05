Create Database LitaProject

SELECT * FROM [dbo].[CAPSTONE REAL]

-------- retrieve the total sales for each product category-------
SELECT Product,SUM(Sales) AS total_sales
FROM [dbo].[CAPSTONE REAL]
GROUP BY Product

---------find the number of sales trasactions in individual region-----
SELECT Region, COUNT(*) AS number_of_transactions
FROM [dbo].[CAPSTONE REAL]
GROUP BY Region

--------find the highest selling products by total sales value-----
SELECT top 1 product, sum (sales) AS Highest_Selling_Product
FROM [dbo].[CAPSTONE REAL]
GROUP BY Product

--------calculate total revenue per product-------
SELECT Product, SUM(sales) AS sales
FROM [dbo].[CAPSTONE REAL]
GROUP BY Product

--------calculate monthly sales total for the current year---------
SELECT MONTH(OrderDate) AS month,
SUM(sales) AS monthly_sales
From [dbo].[CAPSTONE REAL]
WHERE
Year(OrderDate) = YEAR(GETDATE())
GROUP BY
	MONTH(OrderDate)
ORDER BY
	month;

-------- find the top 5 customers by tota; purchase amount-----
SELECT TOP 5 OrderId, Region, SUM(sales) AS total_purchase_amount
FROM [dbo].[CAPSTONE REAL]
GROUP BY orderId,
Region
ORDER BY SUM(Sales) DESC;

------ calculate the percentage of total sales contributed by each region-----
SELECT Region,
SUM(sales) AS Total_Sales,
(CAST(SUM(sales) AS FLOAT) / (SELECT CAST(SUM(sales) AS FLOAT)
FROM [dbo].[CAPSTONE REAL]) *100) AS Sales_Percentage
FROM [dbo].[CAPSTONE REAL]
GROUP BY Region;

------- identify products with no sales in the last quarter........
SELECT Distinct Product
FROM [dbo].[CAPSTONE REAL]
WHERE Product NOT IN (
	SELECT Product
	FROM [dbo].[CAPSTONE REAL]
	WHERE OrderDate >= DATEADD(month, -1, GETDATE ())
	)
	ORDER BY Product;
