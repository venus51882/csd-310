CREATE DATABASE BacchusWinery;

USE BacchusWinery;

CREATE TABLE Departments (
    department_id VARCHAR(5),
    department_name VARCHAR(80),
    hours_worked VARCHAR(80),
    PRIMARY KEY (department_id)
);

INSERT INTO Departments
VALUES ('001', 'Owner', 'Management'),
       ('900', 'Marketing', 'Management'),
       ('901', 'Accounting/Payroll', 'Management'),
       ('902', 'Human Resources', 'Management'),
       ('903', 'Distribution', 'Management'),
       ('700A', '1st Shift Wine Bottler', '40 hours/week'),
       ('700B', '2nd Shift Wine Bottler', '32 hours/week'),
       ('701A', '1st Shift Wine Maker', '45 hours/week'),
       ('701B', '2nd Shift Wine Maker', '45 hours/week'),
       ('702A', '1st Shift Wine Shipper', '40 hours/week'),
       ('702B', '2nd Shift Wine Shipper', '40 hours/week');



CREATE TABLE ManagementEmployees (
    employee_id int NOT NULL AUTO_INCREMENT PRIMARY KEY,
    emp_first_name varchar(30),
    emp_last_name varchar(30),
    emp_title varchar(60),
    hire_date date,
    department_id varchar(3),
    FOREIGN KEY (department_id) REFERENCES Departments(department_id)
);

INSERT INTO ManagementEmployees (emp_first_name, emp_last_name, emp_title, hire_date, department_id)
VALUES 
('Stan', 'Bacchus', 'Owner/Chief Executive Officer', '2020-06-23', '001'),
('Davis', 'Bacchus', 'Owner/Chief Executive Officer', '2020-06-23', '001'),
('Janet', 'Collins', 'Chief Financial Officer', '2012-01-18', '901'),
('Roz', 'Murphy', 'Chief Marketing Officer', '2003-11-02', '900'),
('Bob', 'Ulrich', 'Marketing Assistant', '2018-12-19', '900'),
('Henry', 'Doyle', 'Chief Operations Officer', '2004-07-25', '903'),
('Maria', 'Costanza', 'Distribution Manager', '2007-09-07', '903');


CREATE TABLE ManagementEmployeeHours (
    entry_id int NOT NULL AUTO_INCREMENT PRIMARY KEY,
    emp_id int,
    curr_quarter varchar(30),
    emp_hours int,
    FOREIGN KEY(emp_id) REFERENCES ManagementEmployees(employee_id)
);

ALTER TABLE ManagementEmployeeHours AUTO_INCREMENT=100;

INSERT INTO ManagementEmployeeHours (emp_id, curr_quarter, emp_hours)
VALUES 
(1, 'Q1', 501),
(1, 'Q2', 548),
(1, 'Q3', 623),
(1, 'Q4', 559),
(2, 'Q1', 515),
(2, 'Q2', 510),
(2, 'Q3', 520),
(2, 'Q4', 544),
(3, 'Q1', 528),
(3, 'Q2', 555),
(3, 'Q3', 612),
(3, 'Q4', 624),
(4, 'Q1', 225),
(4, 'Q2', 283),
(4, 'Q3', 270),
(4, 'Q4', 304),
(5, 'Q1', 488),
(5, 'Q2', 622),
(5, 'Q3', 687),
(5, 'Q4', 612),
(6, 'Q1', 490),
(6, 'Q2', 476),
(6, 'Q3', 598),
(6, 'Q4', 708),
(7, 'Q1', 483),
(7, 'Q2', 498),
(7, 'Q3', 601),
(7, 'Q4', 723);



CREATE TABLE ProductionEmployees (
    employee_id INT NOT NULL PRIMARY KEY,
    employee_first_name VARCHAR(60),
    employee_last_name VARCHAR(60),
    department_id VARCHAR(4),
    FOREIGN KEY(department_id) REFERENCES Departments(department_id)
);

INSERT INTO ProductionEmployees
VALUES (001, 'Tony', 'Stark', '700A'),
       (002, 'Thor', 'Odinson', '700A'),
       (003, 'Janet', 'Van Dyke', '700A'),
       (004, 'Hank', 'Pym', '700A'),
       (005, 'Bruce', 'Banner', '700A'),
       (006, 'Steve', 'Rogers', '700B'),
       (007, 'Clint', 'Barton', '700B'),
       (008, 'Pietro', 'Frank', '700B'),
       (009, 'Wanda', 'Frank', '701A'),
       (010, 'Luke', 'Charles', '701A'),
       (011, 'Victor', 'Shade', '701A'),
       (012, 'Dane', 'Whitman', '701A'),
       (013, 'Natasha', 'Romanoff', '701B'),
       (014, 'Philip', 'McCoy', '701B'),
       (015, 'Heather', 'Douglas', '701B'),
       (016, 'Patricia', 'Walker', '702A'),
       (017, 'Simon', 'Williams', '702A'),
       (018, 'Matt', 'Hawk', '702A'),
       (019, 'Carol', 'Danvers', '702B'),
       (020, 'Peter', 'Parker', '702B');

CREATE TABLE Wine (
    wine_id int NOT NULL AUTO_INCREMENT,
    wine_name varchar(30),
    PRIMARY KEY (wine_id)
);

ALTER TABLE Wine AUTO_INCREMENT=380;

INSERT INTO Wine(wine_name)
VALUES
('Merlot'),
('Cabernet'),
('Chablis'),
('Chardonnay');





CREATE TABLE Sales (
    sale_id int NOT NULL AUTO_INCREMENT,
    wine_id int,
    sale_date date,
    PRIMARY KEY (sale_id),
    FOREIGN KEY (wine_id) REFERENCES Wine(wine_id)
);

ALTER TABLE Sales AUTO_INCREMENT=100;

INSERT INTO Sales(wine_id, sale_date)
VALUES
(380, '2024-03-01'),
(381, '2024-03-23'),
(382, '2024-04-01'),
(383, '2024-03-16'),
(383, '2024-03-02'),
(380, '2024-03-28');

CREATE TABLE WineInventory (
    wine_inventory_id int NOT NULL AUTO_INCREMENT,
    wine_id int,
    stock int,
    PRIMARY KEY (wine_inventory_id),
    FOREIGN KEY (wine_id) REFERENCES Wine(wine_id)
);

INSERT INTO WineInventory(wine_id, stock)
VALUES
(380, 982),
(381, 384),
(382, 492),
(383, 131);



CREATE TABLE SupplierInfo (
    supplier_id int NOT NULL AUTO_INCREMENT,
    supplier_name varchar(60),
    PRIMARY KEY (supplier_id)
);

INSERT INTO SupplierInfo(supplier_name)
VALUES
('Corks ''R'' Us'),
('UPS'),
('Vatsmore');





CREATE TABLE OrderTracking (
    tracking_number varchar(8) NOT NULL,
    expected_delivery date,
    actual_delivery date,
    PRIMARY KEY (tracking_number)
);

INSERT INTO OrderTracking
VALUES
('XY2362ZA', '2024-02-01', '2024-01-23'),
('XY3248ZB', '2024-02-01', '2024-01-28'),
('XY9835ZC', '2024-02-01', '2024-01-27'),
('XY6783ZD', '2024-03-01', '2024-02-22'),
('XY5728ZE', '2024-03-01', '2024-03-24'),
('XY4719ZF', '2024-03-01', '2024-03-18'),
('XY4723ZG', '2024-03-01', '2024-02-28'),
('XY4761ZH', '2024-04-01', '2024-03-30');







CREATE TABLE SupplierDelivery (
    delivery_id int NOT NULL AUTO_INCREMENT,
    supplier_id int,
    tracking_number varchar(8),
    PRIMARY KEY (delivery_id),
    FOREIGN KEY (supplier_id) REFERENCES SupplierInfo(supplier_id)
);

INSERT INTO SupplierDelivery(supplier_id, tracking_number)
VALUES
(3,'XY2362ZA'),
(1, 'XY3248ZB'),
(1, 'XY9835ZC'),
(2, 'XY6783ZD'),
(1, 'XY5728ZE'),
(2, 'XY4719ZF'),
(3, 'XY4723ZG'),
(1, 'XY4761ZH');




CREATE TABLE Supplies (
    supply_id int NOT NULL,
    supplier_id int,
    supply_name varchar(60),
    PRIMARY KEY (supply_id),
    FOREIGN KEY (supplier_id) REFERENCES SupplierInfo(supplier_id)
);

INSERT INTO Supplies
VALUES
(101, 1, 'Bottles'),
(102, 1, 'Corks'),
(201, 2, 'Labels'),
(202, 2, 'Boxes'),
(301, 3, 'Vats'),
(302, 3, 'Tubing');





CREATE TABLE Inventory (
    inventory_id varchar(2) NOT NULL,
    supply_id int,
    product_amount int,
    checked_date date,
    PRIMARY KEY (inventory_id),
    FOREIGN KEY (supply_id) REFERENCES Supplies(supply_id)
);


INSERT INTO Inventory
VALUES
('1A', 101, 500, '2024-04-01'),
('2A', 102, 550, '2024-04-01'),
('3A', 201, 60, '2024-04-03'),
('4A', 202, 75, '2024-03-29'),
('5A', 301, 4, '2024-04-15'),
('6A', 302, 7, '2024-04-28');