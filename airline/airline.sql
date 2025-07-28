-- 1. Crear la base de datos si no existe
CREATE DATABASE IF NOT EXISTS airline;

-- 2. Usar la base de datos
USE airline;

-- 3. Crear la tabla customers
CREATE TABLE IF NOT EXISTS customers (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    status VARCHAR(50) NOT NULL 
);

-- 4. Crear la tabla aircraft
CREATE TABLE IF NOT EXISTS aircraft (
    id INT AUTO_INCREMENT PRIMARY KEY,
    aircraft_type VARCHAR(100) NOT NULL,
    capacity INT NOT NULL DEFAULT 0
);

-- 5. Crear la tabla flight
CREATE TABLE IF NOT EXISTS flight (
    flight_number VARCHAR(10) NOT NULL PRIMARY KEY,
    aircraft_id INT NOT NULL,
    flight_mileage INT NOT NULL DEFAULT 0,
    FOREIGN KEY (aircraft_id) REFERENCES aircraft(id)
);

-- 6. Crear la tabla customer_flight
CREATE TABLE IF NOT EXISTS customer_flight (
    customer_id INT NOT NULL,
    flight_number VARCHAR(10) NOT NULL,
    total_mileage INT NOT NULL DEFAULT 0,
    PRIMARY KEY (customer_id, flight_number),
    FOREIGN KEY (customer_id) REFERENCES customers(id),
    FOREIGN KEY (flight_number) REFERENCES flight(flight_number)
);

-- Insertar datos en customers
INSERT INTO customers (id, name, status) VALUES
(1, 'Agustine Riviera', 'Silver'),
(2, 'Sam Rio', 'None'),
(3, 'Jessica James', 'Silver'),
(4, 'Alaina Sepulvida', 'None'),
(5, 'Tom Jones', 'Gold'),
(6, 'Ana Janco', 'Silver'),
(7, 'Jennifer Cortez', 'Gold'),
(8, 'Christian Janco', 'Silver');

-- Insertar datos en aircraft
INSERT INTO aircraft (id, aircraft_type, capacity) VALUES
(1, 'Boeing 747', 400),
(2, 'Airbus A330', 236),
(3, 'Boeing 777', 264);

-- Insertar datos en flight
INSERT INTO flight (flight_number, aircraft_id, flight_mileage) VALUES
("DL143", 1, 135),
("DL37", 1, 531),
("DL122", 2, 4370),
("DL53", 3, 2078),
("DL222", 3, 1765);

-- Insertar datos en customer_flight
INSERT INTO customer_flight (customer_id, flight_number, total_mileage) VALUES
(1, "DL143", 115235),
(1, "DL122", 115235),
(2, "DL143", 2653),
(2, "DL37", 2653),
(3, "DL143", 127656),
(3, "DL122", 127656),
(4, "DL122", 6008),
(5, "DL122", 205767),
(5, "DL53", 205767),
(5, "DL222", 205767),
(6, "DL222", 136773),
(7, "DL222", 300582),
(8, "DL222", 14642);
