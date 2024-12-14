-- 1: In this challenge, you need to create a CTE to identify suppliers who provide 
-- products with a unit price above the average unit price across all products. 
-- Retrieve the supplier name and the number of such high-value products they supply.

WITH cteSupplierProd AS (SELECT
  sup.SupplierName,
  prod.ProductName,
  prod.UnitPrice
FROM Products AS prod
INNER JOIN Suppliers AS sup ON prod.SupplierID = sup.SupplierID
GROUP BY sup.SupplierName, prod.ProductName)
SELECT 
  SupplierName,
  COUNT(ProductName) AS numProductsAboveAvg
FROM cteSupplierProd 
WHERE UnitPrice > (SELECT AVG(UnitPrice) FROM Products);

-- 2: In this challenge, you need to create a CTE to identify products with a stock 
-- quantity below a specified threshold, 50 units. 
-- Then, retrieve the product name, category name, and the remaining stock quantity.

WITH cteProductsLowStock AS (
  SELECT
    *
  FROM Products
  WHERE StockQuantity < 50
)
SELECT
  cpls.ProductName,
  c.CategoryName,
  cpls.StockQuantity
FROM cteProductsLowStock cpls
INNER JOIN Categories c 
  ON cpls.CategoryID = c.CategoryID;