show databases;
CREATE DATABASE if not exists maanas;
USE maanas;


CREATE TABLE Driverss(
    driver_id INT PRIMARY KEY,
    driver_name VARCHAR(100),
    driver_license VARCHAR(20)
);

CREATE TABLE Vehicless(
    vehicle_id INT PRIMARY KEY,
    vehicle_number VARCHAR(20),
    driver_id INT,
    FOREIGN KEY (driver_id) REFERENCES Drivers(driver_id)
);

CREATE TABLE Accidentss(
    accident_id INT PRIMARY KEY,
    accident_date DATE,
    location VARCHAR(100),
    vehicle_id INT,
    damage_amount DECIMAL(10, 2),
    FOREIGN KEY (vehicle_id) REFERENCES Vehicles(vehicle_id)
);


INSERT INTO Driverss values
(1, 'John Doe', 'DL12345'),
(2, 'Jane Smith', 'DL54321'),
(3, 'Mike Johnson', 'DL67890'),
(4, 'Alice Brown', 'DL98765'),
(5, 'Bob White', 'DL11223');

INSERT INTO Vehicless values
(101, 'MH12AB1234', 1),
(102, 'MH13CD5678', 2),
(103, 'MH14EF9101', 3),
(104, 'MH15GH1121', 4),
(105, 'MH16IJ3141', 5);

INSERT INTO Accidentss values
(1001, '2024-01-10', 'Mumbai', 101, 15000),
(1002, '2024-02-15', 'Pune', 102, 30000),
(1003, '2024-03-20', 'Nagpur', 103, 25000),
(1004, '2024-04-25', 'Nashik', 104, 10000),
(1005, '2024-05-30', 'Aurangabad', 105, 40000);

SELECT accident_date from Accidentss;
SELECT DISTINCT v.driver_id
FROM Accident a
JOIN Vehicle v ON a.vehicle_id = v.vehicle_id
WHERE a.damage_amount >= 25000;
SHOW DATABASES;
select * from Driverss;
select * from Vehicless;
select * from Accidentss;
