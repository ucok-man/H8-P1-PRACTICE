INSERT  INTO employee_positions (ep_position)
VALUES 
	('waiter'),
	('cashier'),
	('chef'),
	('manager');
	
INSERT  INTO employees (emp_firstname, emp_lastname, ep_id)
VALUES ('John', 'Doe', 1);

INSERT INTO menu_item_categories(mic_category)
VALUES 
	('appetizer'), 
	('course'),
	('main course');

INSERT  INTO menu_items (mi_name, mi_description,mi_price,mic_id)
VALUES ('steak', 'grilled sirloin steak', 25.99, 3);

INSERT INTO order_status (os_status)
VALUES 
	('pending'), 
	('completed'), 
	('canceled');

INSERT  INTO orders (emp_id, order_table_number, order_date, os_id)
VALUES (1, 5, '2023-08-04', 1);

INSERT  INTO order_items (order_id, mi_id, oi_quantity, oi_subtotal)
VALUES (1, 1, 2, 51.98);

INSERT  INTO payment_methods (pm_method)
VALUES 
	('cash'), 
	('credit card');

INSERT  INTO payments (order_id, pm_id, payment_date, payment_total_amount)
VALUES (1, 2, '2023-0-04', 51.98);
