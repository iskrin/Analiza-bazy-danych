/* CEL: Ranking 3 najlepiej sprzedających się produktów w każdej linii produktów (kategorii).*/

SELECT * FROM (
    SELECT 
        p.productLine,
        p.productName,
        SUM(od.quantityOrdered) AS units_sold,
        RANK() OVER (PARTITION BY p.productLine ORDER BY SUM(od.quantityOrdered) DESC) AS sales_rank
    FROM products p
    JOIN orderdetails od ON p.productCode = od.productCode
    GROUP BY p.productLine, p.productName
) AS ranked_products
WHERE sales_rank <= 3;