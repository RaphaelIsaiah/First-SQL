CREATE DATABASE IF NOT EXISTS SKioskOS;
USE skioskos;
CREATE TABLE IF NOT EXISTS Inventory (
    EntryID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    TransactionDate DATE,
    SON INT,
    ItemSpecification VARCHAR(150),
    ItemIn INT,
    ItemOut INT,
    Balance INT,
    OrderNumber INT,
    InsertDate DATETIME DEFAULT CURRENT_TIMESTAMP
);

-- drop database skioskos;