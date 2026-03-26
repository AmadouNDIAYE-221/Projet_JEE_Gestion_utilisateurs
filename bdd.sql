CREATE DATABASE IF NOT EXISTS gestion_users;
USE gestion_users;

CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR(100) NOT NULL,
    prenom VARCHAR(100) NOT NULL,
    login VARCHAR(50) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL
);

-- Mot de passe: admin123 (haché en SHA-256)
INSERT INTO users (nom, prenom, login, password) VALUES 
('Admin', 'System', 'admin', '240be518fabd2724ddb6f04eeb1da5967448d7e831c08c8fa822809f74c720a9');
