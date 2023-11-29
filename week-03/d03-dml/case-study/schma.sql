CREATE TABLE employee_positions (
	ep_id int AUTO_INCREMENT PRIMARY KEY,
	ep_position varchar(255) NOT NULL
);

CREATE TABLE employees(
	emp_id int AUTO_INCREMENT PRIMARY KEY,
	emp_firstname varchar(255) NOT NULL,
	emp_lastname varchar(255) NOT NULL,
	ep_id int NOT NULL,
	
	FOREIGN KEY (ep_id) REFERENCES employee_positions(ep_id)
);

CREATE TABLE menu_item_categories(
	mic_id int AUTO_INCREMENT PRIMARY KEY,
	mic_category varchar(255) NOT NULL
);

CREATE TABLE menu_items(
	mi_id int AUTO_INCREMENT PRIMARY KEY,
	mi_name varchar(255) NOT NULL,
	mi_description varchar(255) NOT NULL,
	mi_price decimal(11,2) NOT NULL,
	mic_id int NOT NULL,
	
	CHECK(mi_price > 0),
	FOREIGN KEY (mic_id) REFERENCES menu_item_categories(mic_id)
);


CREATE TABLE	order_status(
	os_id int AUTO_INCREMENT PRIMARY KEY,
	os_status varchar(255) NOT NULL
);

CREATE TABLE orders(
	order_id int AUTO_INCREMENT PRIMARY KEY,
	emp_id int NOT NULL,
	order_table_number int NOT NULL,
	order_date date NOT NULL DEFAULT current_date(),
	os_id  int NOT NULL,
	
	CHECK	(order_table_number > 0),
	FOREIGN KEY (os_id)  REFERENCES order_status(os_id),
	FOREIGN KEY (emp_id) REFERENCES employees(emp_id)
); 

CREATE TABLE order_items (
	oi_id int AUTO_INCREMENT PRIMARY KEY,
	order_id int NOT NULL,
	mi_id int NOT NULL,
	oi_quantity int NOT NULL,
	oi_subtotal decimal(14,2) NOT NULL,
	
	CHECK (oi_quantity > 0 AND oi_subtotal > 0),
	FOREIGN KEY (order_id) REFERENCES	orders(order_id),
	FOREIGN KEY (mi_id) REFERENCES menu_items(mi_id)
);

CREATE TABLE payment_methods(
	pm_id int AUTO_INCREMENT PRIMARY KEY,
	pm_method varchar(255) NOT NULL
);

CREATE TABLE payments(
	payment_id int AUTO_INCREMENT PRIMARY KEY,
	order_id int NOT NULL,
	pm_id int NOT NULL,
	payment_date date NOT NULL,
	payment_total_amount int NOT NULL,
	
	CHECK(payment_total_amount > 0),
	FOREIGN KEY (order_id) REFERENCES orders(order_id),
	FOREIGN KEY (pm_id) REFERENCES payment_methods(pm_id)
);
