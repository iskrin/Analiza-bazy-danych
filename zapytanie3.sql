/* CEL: Obliczenie łącznej sprzedaży dla każdego pracownika i porównanie jej ze średnią sprzedażą w firmie.*/

WITH EmployeeSales AS (
    SELECT 
        e.employeeNumber,
        CONCAT(e.firstName, ' ', e.lastName) AS sales_rep,
        SUM(od.quantityOrdered * od.priceEach) AS total_sales
    FROM employees e
    JOIN customers c ON e.employeeNumber = c.salesRepEmployeeNumber
    JOIN orders o ON c.customerNumber = o.customerNumber
    JOIN orderdetails od ON o.orderNumber = od.orderNumber
    GROUP BY e.employeeNumber
)

SELECT 
    sales_rep,
    total_sales,
    (SELECT AVG(total_sales) FROM EmployeeSales) AS company_average,
    total_sales - (SELECT AVG(total_sales) FROM EmployeeSales) AS performance_diff
FROM EmployeeSales
ORDER BY total_sales DESC;
