CREATE DATABASE IF NOT EXISTS digibjvb_bdexch;
USE digibjvb_bdexch;

-- Users Table
CREATE TABLE users (
    id INT PRIMARY KEY AUTO_INCREMENT,
    username VARCHAR(50) UNIQUE,
    email VARCHAR(100) UNIQUE,
    password VARCHAR(255),
    role ENUM('admin','agent','user') DEFAULT 'user',
    balance DECIMAL(18,2) DEFAULT 0,
    referral_code VARCHAR(20) UNIQUE,
    referred_by VARCHAR(20),
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP
);

-- Transactions Table
CREATE TABLE transactions (
    id INT PRIMARY KEY AUTO_INCREMENT,
    sender_id INT,
    receiver_id INT,
    amount DECIMAL(18,2),
    type ENUM('send','receive','add_money','withdraw','payment'),
    status ENUM('pending','completed','failed') DEFAULT 'pending',
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (sender_id) REFERENCES users(id),
    FOREIGN KEY (receiver_id) REFERENCES users(id)
);

-- Referrals Table
CREATE TABLE referrals (
    id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT,
    referred_user_id INT,
    reward DECIMAL(18,2) DEFAULT 0,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP
);

-- Banners Table
CREATE TABLE banners (
    id INT PRIMARY KEY AUTO_INCREMENT,
    image VARCHAR(255),
    link VARCHAR(255),
    active BOOLEAN DEFAULT 1,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP
);