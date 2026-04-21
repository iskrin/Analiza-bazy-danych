/* CEL: Znalezienie 10 najbardziej wartościowych klientów na podstawie sumy ich wpłat.*/

SELECT 
    c.customerName, 
    c.city, 
    c.country, 
    COUNT(o.orderNumber) AS total_orders,
    SUM(p.amount) AS total_paid
FROM customers c
JOIN orders o ON c.customerNumber = o.customerNumber
JOIN payments p ON c.customerNumber = p.customerNumber
GROUP BY c.customerNumber
ORDER BY total_paid DESC
LIMIT 10;
