/* CEL: Klasyfikacja produktów na podstawie ich marży (różnica między ceną sprzedaży a kosztem zakupu).*/

SELECT 
    productName,
    buyPrice,
    MSRP (Manufacturer Suggested Retail Price),
    (MSRP - buyPrice) AS absolute_margin,
    CASE 
        WHEN (MSRP - buyPrice) > 50 THEN 'High Margin'
        WHEN (MSRP - buyPrice) BETWEEN 20 AND 50 THEN 'Medium Margin'
        ELSE 'Low Margin'
    END AS margin_category
FROM products
ORDER BY absolute_margin DESC;
