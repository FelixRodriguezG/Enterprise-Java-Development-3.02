-- 1. Crear la base de datos si no existe
CREATE DATABASE IF NOT EXISTS blog;

-- 2. Usar la base de datos
USE blog;

-- 3. Crear la tabla user
CREATE TABLE IF NOT EXISTS user (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL
);

-- 4. Crear la tabla post
CREATE TABLE IF NOT EXISTS post (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    title VARCHAR(100) NOT NULL,
    count_words INT NOT NULL DEFAULT 0, 
    views INT NOT NULL DEFAULT 0,
    FOREIGN KEY (user_id) REFERENCES user(id)
);