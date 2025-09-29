CREATE DATABASE IF NOT EXISTS maanas;
USE maanas;

CREATE TABLE Driver (
    driver_id INT PRIMARY KEY,
    driver_name VARCHAR(100),
    driver_license VARCHAR(20)
);

CREATE TABLE Vehicle (
    vehicle_id INT PRIMARY KEY,
    vehicle_number VARCHAR(20),
    driver_id INT,
    FOREIGN KEY (driver_id) REFERENCES Driver(driver_id)
);

CREATE TABLE Accident (
    accident_id INT PRIMARY KEY,
    accident_date DATE,
    location VARCHAR(100),
    vehicle_id INT,
    damage_amount DECIMAL(10, 2),
    FOREIGN KEY (vehicle_id) REFERENCES Vehicle(vehicle_id)
);

-- Fixed spelling of table name: participatied → participated
CREATE TABLE participated (
    accident_id INT,
    vehicle_id INT,
    driver_id INT,
    damage_amount DECIMAL(10, 2),
    PRIMARY KEY (accident_id, vehicle_id),
    FOREIGN KEY (accident_id) REFERENCES Accident(accident_id),
    FOREIGN KEY (vehicle_id) REFERENCES Vehicle(vehicle_id),
    FOREIGN KEY (driver_id) REFERENCES Driver(driver_id)
);

-- Insert 5 tuples into each table

INSERT INTO Driver VALUES
(1, 'Richard', 'KA052250'),
(2, 'Pradeep', 'KA031181'),
(3, 'Smith', 'KA095477'),
(4, 'Venu', 'KA053408'),
(5, 'John', 'KA041702');

INSERT INTO Vehicle VALUES
(101, 'KA052250', 1),
(102, 'KA031181', 2),
(103, 'KA095477', 3),
(104, 'KA053408', 4),
(105, 'KA041702', 5);

INSERT INTO Accident VALUES
(1001, '2024-01-10', 'Mumbai', 101, 15000),
(1002, '2024-02-15', 'Pune', 102, 30000),
(1003, '2024-03-20', 'Nagpur', 103, 25000),
(1004, '2024-04-25', 'Nashik', 104, 10000),
(1005, '2024-05-30', 'Aurangabad', 105, 40000);

-- Now populate the participated table — since it's not auto-populated, insert matching data

INSERT INTO participated (accident_id, vehicle_id, driver_id, damage_amount) VALUES
(1001, 101, 1, 15000),
(1002, 102, 2, 30000),
(1003, 103, 3, 25000),
(1004, 104, 4, 10000),
(1005, 105, 5, 40000);

-- Final Query to list the entire participated relation in descending order of damage_amount
