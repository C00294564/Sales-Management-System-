-- Create the SalesSystem schema and set the default character set to utf8mb4
CREATE DATABASE IF NOT EXISTS SalesSystem DEFAULT CHARACTER SET utf8mb4;
USE SalesSystem;

-- Table: Customer
CREATE TABLE Customer (
    customerId INT AUTO_INCREMENT PRIMARY KEY,
    firstName VARCHAR(50) NOT NULL,
    lastName VARCHAR(50) NOT NULL,
    address VARCHAR(100) NOT NULL,
    email VARCHAR(50) NOT NULL,
    phoneNumber VARCHAR(10) NOT NULL
)

-- Table: Orders
CREATE TABLE Orders (
    orderId INT AUTO_INCREMENT PRIMARY KEY,
    customerId INT NOT NULL,
    orderDate DATETIME NOT NULL,
    totalAmount DECIMAL(10,2) DEFAULT NULL,
    orderStatus VARCHAR(50) NOT NULL,
    FOREIGN KEY (customerId) REFERENCES Customer(customerId)
)

-- Table: CustomerFeedback
CREATE TABLE CustomerFeedback (
    feedbackId INT AUTO_INCREMENT PRIMARY KEY,
    customerId INT NOT NULL,
    orderId INT DEFAULT NULL,
    comments TEXT NOT NULL,
    rating INT,
    CONSTRAINT chk_rating CHECK (rating BETWEEN 1 AND 5),
    FOREIGN KEY (customerId) REFERENCES Customer(customerId),
    FOREIGN KEY (orderId) REFERENCES Orders(orderId)
)

-- Table: Delivery
CREATE TABLE Delivery (
    deliveryId INT AUTO_INCREMENT PRIMARY KEY,
    orderId INT NOT NULL,
    estimatedDeliveryTime DATETIME NOT NULL,
    trackingStatus VARCHAR(50) NOT NULL,
    FOREIGN KEY (orderId) REFERENCES Orders(orderId)
)

-- Table: Equipment
CREATE TABLE Equipment (
    equipmentId INT AUTO_INCREMENT PRIMARY KEY,
    equipmentName VARCHAR(50) NOT NULL,
    equipmentType VARCHAR(50) NOT NULL,
    equipmentSpecifications TEXT NOT NULL,
    quantityAvailable INT NOT NULL,
    equipmentPrice DECIMAL(10,2) NOT NULL
) 

-- Table: FaultyItems
CREATE TABLE FaultyItems (
    faultId INT AUTO_INCREMENT PRIMARY KEY,
    equipmentId INT NOT NULL,
    batchNumber INT NOT NULL,
    faultDescription TEXT NOT NULL,
    reportedDate DATETIME NOT NULL,
    FOREIGN KEY (equipmentId) REFERENCES Equipment(equipmentId)
) 

-- Table: OrderAndEquipment
CREATE TABLE OrderAndEquipment (
    orderId INT NOT NULL,
    equipmentId INT NOT NULL,
    PRIMARY KEY (orderId, equipmentId),
    FOREIGN KEY (orderId) REFERENCES Orders(orderId),
    FOREIGN KEY (equipmentId) REFERENCES Equipment(equipmentId)
) 

-- Table: OrderReturns
CREATE TABLE OrderReturns (
    returnId INT AUTO_INCREMENT PRIMARY KEY,
    orderId INT NOT NULL,
    equipmentId INT NOT NULL,
    reason TEXT NOT NULL,
    orderReturnStatus VARCHAR(50) NOT NULL,
    replacementRequested BOOLEAN,
    FOREIGN KEY (orderId) REFERENCES Orders(orderId),
    FOREIGN KEY (equipmentId) REFERENCES Equipment(equipmentId)
)

-- Table: Reports
CREATE TABLE Reports (
    reportId INT AUTO_INCREMENT PRIMARY KEY,
    reportType VARCHAR(50) NOT NULL,
    reportData TEXT NOT NULL,
    reportDate DATETIME NOT NULL
) 

-- Table: Staff
CREATE TABLE Staff (
    staffId INT AUTO_INCREMENT PRIMARY KEY,
    firstName VARCHAR(50) NOT NULL,
    lastName VARCHAR(50) NOT NULL,
    staffRole VARCHAR(10) NOT NULL,
    email VARCHAR(50) NOT NULL,
    phoneNumber VARCHAR(50) NOT NULL
) 