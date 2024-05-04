# Milestone 2
# Mason Buller, Margaret Shimerdla, Javonta Young, Julio Cruz Romero

import mysql.connector
from mysql.connector import errorcode

config = {
    "user": "root",
    "password": "milkshakes",
    "host": "127.0.0.1",
    "database": "BacchusWinery",
    "raise_on_warnings": True
}

try:
    db = mysql.connector.connect(**config)
    print("\n Database user {} connected to MySQL on host {} with database {}".format(config["user"], config["host"], config["database"]))
    input("\n\nPress any key to continue...")
except mysql.connector.Error as err:
    if err.errno == errorcode.ER_ACCESS_DENIED_ERROR:
        print(" The supplied username or password are invalid")
    elif err.errno == errorcode.ER_BAD_DB_ERROR:
        print(" The specified database does not exist")

    else:
        print(err)
finally:
    cursor = db.cursor()

    cursor.execute("SELECT * FROM ManagementEmployees")
    list = cursor.fetchall()
    print("\n-- DISPLAYING Management Employees RECORDS --")
    for e in list:
        print("Employee ID: {}\nEmp First Name: {}\nEmp Last Name: {}\nEmp Title: {}\nEmp Hire Date: {}\nDepartment ID: {}\n".format(e[0], e[1], e[2], e[3], e[4], e[5]))
    
    cursor.execute("SELECT * FROM Departments")
    list = cursor.fetchall()
    print("\n-- DISPLAYING Departments RECORDS --")
    for e in list:
        print("Department ID: {}\nDepartment Name: {}\nHours Worked: {}\n".format(e[0], e[1], e[2]))

    cursor.execute("SELECT * FROM ManagementEmployeeHours")
    list = cursor.fetchall()
    print("\n-- DISPLAYING Management Employee Hours RECORDS --")
    for e in list:
        print("Entry ID: {}\nEmployee ID: {}\nQuarter: {}\nEmployee Hours: {}\n".format(e[0], e[1], e[2], e[3]))


    cursor.execute("SELECT * FROM ProductionEmployees")
    list = cursor.fetchall()
    print("\n-- DISPLAYING Production Employees RECORDS --")
    for e in list:
        print("Employee ID: {}\nEmp First Name: {}\nEmp Last Name: {}\nDepartment ID: {}\n".format(e[0], e[1], e[2], e[3]))

    cursor.execute("SELECT * FROM Wine")
    list = cursor.fetchall()
    print("\n-- DISPLAYING Wine RECORDS --")
    for e in list:
        print("Wine ID: {}\nWine Name: {}\n".format(e[0], e[1]))


    cursor.execute("SELECT * FROM Sales")
    list = cursor.fetchall()
    print("\n-- DISPLAYING Sales RECORDS --")
    for e in list:
        print("Sale ID: {}\nWine ID: {}\nSale Date: {}\n".format(e[0], e[1], e[2]))


    cursor.execute("SELECT * FROM WineInventory")
    list = cursor.fetchall()
    print("\n-- DISPLAYING Wine Inventory RECORDS --")
    for e in list:
        print("Wine Inventory ID: {}\nWine ID: {}\nStock: {}\n".format(e[0], e[1], e[2]))


    cursor.execute("SELECT * FROM SupplierInfo")
    list = cursor.fetchall()
    print("\n-- DISPLAYING Supplier Info RECORDS --")
    for e in list:
        print("Supplier ID: {}\nSupplier Name: {}\n".format(e[0], e[1]))


    cursor.execute("SELECT * FROM OrderTracking")
    list = cursor.fetchall()
    print("\n-- DISPLAYING Order Tracking RECORDS --")
    for e in list:
        print("Tracking Number: {}\nExpected Delivery: {}\nActual Delivery: {}\n".format(e[0], e[1], e[2]))


    cursor.execute("SELECT * FROM SupplierDelivery")
    list = cursor.fetchall()
    print("\n-- DISPLAYING Supplier Delivery RECORDS --")
    for e in list:
        print("Delivery ID: {}\nSupplier ID: {}\nTracking Number: {}\n".format(e[0], e[1], e[2]))


    cursor.execute("SELECT * FROM Supplies")
    list = cursor.fetchall()
    print("\n-- DISPLAYING Supplies RECORDS --")
    for e in list:
        print("Supply ID: {}\nSupplier ID: {}\nSupply Name:{}\n".format(e[0], e[1], e[2]))


    cursor.execute("SELECT * FROM Inventory")
    list = cursor.fetchall()
    print("\n-- DISPLAYING Inventory RECORDS --")
    for e in list:
        print("Inventory ID: {}\nSupply ID: {}\nProduct Amount:{}\nChecked Date:{}\n".format(e[0], e[1], e[2], e[3]))

    db.close()


