CREATE DATABASE IF NOT EXISTS maanas;
USE maanas;

-- Corrected table names to match foreign key references
CREATE TABLE Driverss (
    driver_id INT PRIMARY KEY,
    driver_name VARCHAR(100),
    driver_license VARCHAR(20)
);

CREATE TABLE Vehicless (
    vehicle_id INT PRIMARY KEY,
    vehicle_number VARCHAR(20),
    driver_id INT,
    FOREIGN KEY (driver_id) REFERENCES Driverss(driver_id)  -- corrected from Drivers to Driverss
);

CREATE TABLE Accidentss (
    accident_id INT PRIMARY KEY,
    accident_date DATE,
    location VARCHAR(100),
    vehicle_id INT,
    damage_amount DECIMAL(10, 2),
    FOREIGN KEY (vehicle_id) REFERENCES Vehicless(vehicle_id)  -- corrected from Vehicles to Vehicless
);

INSERT INTO Driverss VALUES
(1, 'Richard', 'KA052250'),
(2, 'Pradeep', 'KA031181'),
(3, 'Smith', 'KA095477'),
(4, 'Venu', 'KA053408'),
(5, 'John', 'KA041702');

INSERT INTO Vehicless VALUES
(101, 'KA052250', 1),
(102, 'KA031181', 2),
(103, 'KA095477', 3),
(104, 'KA053408', 4),
(105, 'KA041702', 5);

INSERT INTO Accidentss VALUES
(1001, '2024-01-10', 'Mysore Road', 101, 15000),
(1002, '2024-02-15', 'South end Circle', 102, 30000),
(1003, '2024-03-20', 'Bull temple Road', 103, 25000),
(1004, '2024-04-25', 'Mysore Road', 104, 10000),
(1005, '2024-05-30', 'Kanakpura Road', 105, 40000);

-- Query to select accident dates
SELECT accident_date FROM Accidentss;

-- Corrected query to select distinct driver_ids with damage_amount >= 25000
SELECT DISTINCT v.driver_id
FROM Accidentss a
JOIN Vehicless v ON a.vehicle_id = v.vehicle_id
WHERE a.damage_amount >= 25000;

-- Show databases
SHOW DATABASES;

-- Select all data from tables
SELECT * FROM Driverss;
SELECT * FROM Vehicless;
SELECT * FROM Accidentss;
