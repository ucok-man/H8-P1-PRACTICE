-- Retrieve all orders with their applied discounts.
-- assume all main course menu have discount 10% each item.
-- if order quantity 2 then discount 20%.
SELECT 
    order_result.*, 
    (order_result.gross_total - order_result.discount_price) AS total_price
FROM 
    (
        SELECT
            oi_id,
            mi_name AS menu_name,
            mic_category AS menu_category,
            mi_price AS menu_price,
        	CASE
                WHEN mic_category = 'main course' THEN '10%'
                ELSE null
            END AS discount,
            order_date,
            os_status AS order_status,
            oi_quantity AS order_quantity,
            oi_subtotal AS gross_total,
        	CASE
        		WHEN mic_category = 'main course' THEN (oi_quantity * 0.1) * oi_subtotal
        	END AS discount_price
        FROM 
            order_items
        INNER JOIN 
            menu_items USING(mi_id)
        INNER JOIN 
            menu_item_categories USING(mic_id)
        INNER JOIN
            orders USING (order_id)
        INNER JOIN
            order_status USING(os_id)
            
    ) AS order_result

WHERE
	order_result.discount IS NOT null;