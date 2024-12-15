-- Challenge 1: In this challenge, you need to find the top 3 customers 
-- who have made the highest total purchases and their ranking based on total purchases. 

SELECT
  CustomerID,
  SUM(Amount) AS SumSales,
  RANK() OVER(ORDER BY SUM(Amount) DESC) AS RankSales
FROM Orders
GROUP BY CustomerID
ORDER BY SumSales DESC;

-- Challenge 2: In this challenge, you need to identify the quantity of the previous order, 
-- as well as calculate the difference between the previous and current order quantities for each order. 

SELECT
  OrderID,
  OrderDate,
  Quantity,
  LAG(Quantity, 1, 0) OVER (ORDER BY OrderDate) AS QuantityLastOrder,
  (Quantity - (LAG(Quantity, 1, 0) OVER (ORDER BY OrderDate))) AS QuantityDiff
FROM Orders
GROUP BY OrderID, OrderDate, Quantity
ORDER BY OrderDate;
