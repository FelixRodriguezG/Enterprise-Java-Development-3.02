-- 1. Crear la base de datos si no existe
CREATE DATABASE IF NOT EXISTS airline;

-- 2. Usar la base de datos
USE airline;

-- 3. Crear la tabla customer
CREATE TABLE IF NOT EXISTS customer (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    state VARCHAR(50) NOT NULL
);

-- 4. Crear la tabla aircraft
CREATE TABLE IF NOT EXISTS aircraft (
    id INT AUTO_INCREMENT PRIMARY KEY,
    aircraft_type VARCHAR(100) NOT NULL,
    capacity INT NOT NULL DEFAULT 0
);

-- 5. Crear la tabla flight
CREATE TABLE IF NOT EXISTS flight (
    id INT AUTO_INCREMENT PRIMARY KEY,
    aircraft_id INT NOT NULL,
    flight_mileage INT NOT NULL DEFAULT 0,
    FOREIGN KEY (aircraft_id) REFERENCES aircraft(id)
);

-- 6. Crear la tabla customer_flight
CREATE TABLE IF NOT EXISTS customer_flight (
    id_customer INT NOT NULL,
    id_flight INT NOT NULL,
    total_mileage INT NOT NULL DEFAULT 0,
    PRIMARY KEY (id_customer, id_flight),
    FOREIGN KEY (id_customer) REFERENCES customer(id),
    FOREIGN KEY (id_flight) REFERENCES flight(id)
);