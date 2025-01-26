USE tokopedia_order_history;

CREATE TABLE orders(
id VARCHAR(100) PRIMARY KEY,
seller_id VARCHAR(100) NOT NULL,
seller_name VARCHAR(100) NOT NULL,
buyer_id VARCHAR(100) NOT NULL,
buyer_name VARCHAR(100) NOT NULL,
shipping_name VARCHAR(100) NOT NULL,
shipping_address VARCHAR(500) NOT NULL,
shipping_phone VARCHAR(25) NOT NULL,
logistic_id VARCHAR(100) NOT NULL,
logistic_name VARCHAR(100) NOT NULL,
payment_method_id VARCHAR(100) NOT NULL,
payment_method_name VARCHAR(100) NOT NULL,
total_quantity INT NOT NULL,
total_weight INT NOT NULL,
total_product_amount BIGINT NOT NULL,
total_shipping_cost BIGINT NOT NULL,
total_shopping_amount BIGINT NOT NULL,
service_charge BIGINT NOT NULL,
total_amount BIGINT NOT NULL
)ENGINE InnoDB;

SELECT * FROM orders;

# Tanggal Pembelian kelewat
ALTER TABLE tokopedia_order_historyrders

# Membuat table order_details
ALTER TABLE orders
ADD COLUMN created_at TIMESTAMP NOT NULL;

CREATE TABLE order_details(
id VARCHAR(100) PRIMARY KEY,
order_id VARCHAR(100) NOT NULL,
product_id VARCHAR(100) NOT NULL,
product_name VARCHAR(250) NOT NULL,
product_weight INT NOT NULL,
product_price BIGINT NOT NULL,
quantity INT NOT NULL,
total_amount BIGINT NOT NULL,
FOREIGN KEY fk_orders_to_order_details (order_id) REFERENCES orders(id)
)ENGINE InnoDB;

SELECT * FROM order_details;

INSERT INTO orders (id, created_at, seller_id, seller_name, buyer_id, buyer_name, shipping_name, shipping_address, shipping_phone, 
					logistic_id, logistic_name, payment_method_id, payment_method_name,
					total_quantity, total_weight, total_product_amount, total_shipping_cost, total_shopping_amount, service_charge, total_amount)
VALUES ('12213213123123', NOW(), 'galery_olahraga_indonesia', 'Galeri Olahraga Indonesia', 'jokomorro', 'Joko Morro', 'Budi Nugraha', 'Jalan Raya Xxx, Jakarta, DKI Jakarta, 434333', '08989899999', 
					'sicepat', 'SiCepat Gokil', 'debit_online', 'Debit Online', 5, 5360, 508500, 60000, 568500, 1000, 569500);

SELECT * FROM orders;

INSERT INTO order_details(id, order_id, product_id, product_name, product_weight,
                          product_price, quantity, total_amount)
VALUES ('1', '12213213123123', 'p1', 'Basketball', 2300, 177900, 2, 355800);

INSERT INTO order_details(id, order_id, product_id, product_name, product_weight,
                          product_price, quantity, total_amount)
VALUES ('2', '12213213123123', 'p2', 'Basketball Warna', 500, 98900, 1, 98900);

INSERT INTO order_details(id, order_id, product_id, product_name, product_weight,
                          product_price, quantity, total_amount)
VALUES ('3', '12213213123123', 'p3', 'Pentil Pompa Bola', 54, 9900, 1, 9900);

INSERT INTO order_details(id, order_id, product_id, product_name, product_weight,
                          product_price, quantity, total_amount)
VALUES ('4', '12213213123123', 'p4', 'Pompa Bola Portable', 198, 43900, 1, 43900);

SELECT * FROM order_details;

# QUERY

# Order Id = 12213213123123

SELECT * FROM orders 
WHERE id = '12213213123123';

SELECT * FROM order_details
WHERE order_id = '12213213123123';

# 1 Query

SELECT * FROM orders as o JOIN order_details od ON o.id = od.order_id
WHERE o.id = '12213213123123';

SELECT * FROM orders WHERE total_amount > 500000;

# Menggabungkan data dari kedua tabel untuk mendapatkan detail lengkap pesanan
SELECT 
    o.id AS order_id,
    o.buyer_name,
    o.total_amount,
    od.product_name,
    od.quantity,
    od.total_amount AS product_total
FROM orders o
INNER JOIN order_details od
ON o.id = od.order_id;

# Menghitung total pendapatan dari semua pesanan
SELECT SUM(total_amount) AS total_revenue FROM orders;
