DROP TABLE IF EXISTS "Customer";
CREATE TABLE "Customer" ("CustomerID" INTEGER PRIMARY KEY  NOT NULL ,"CustomerName" VARCHAR NOT NULL  DEFAULT (null) ,"CustomerAddress" VARCHAR NOT NULL  DEFAULT (null) );
INSERT INTO "Customer" VALUES(1,'Zuckerberg','California');
INSERT INTO "Customer" VALUES(2,'Musk','California');
INSERT INTO "Customer" VALUES(3,'Torvalds','Oregon‎');
INSERT INTO "Customer" VALUES(4,'Stroustrup','New York');
DROP TABLE IF EXISTS "Item";
CREATE TABLE "Item" ("ItemID" INTEGER PRIMARY KEY  NOT NULL , "Name" VARCHAR NOT NULL , "ItemPrice" DOUBLE);
INSERT INTO "Item" VALUES(1,'Azure',500);
INSERT INTO "Item" VALUES(2,'Office 365',150);
INSERT INTO "Item" VALUES(3,'Pixel 2.0',700);
INSERT INTO "Item" VALUES(4,'G Suite',300);
INSERT INTO "Item" VALUES(5,'Cognos',1000);
INSERT INTO "Item" VALUES(6,'Bluemix',600);
DROP TABLE IF EXISTS "ItemsByVendor";
CREATE TABLE "ItemsByVendor" ( ID INTEGER PRIMARY KEY , VendorID  INTEGER REFERENCES Vendor (VendorID), ItemID INTEGER REFERENCES Item (ItemID));
INSERT INTO "ItemsByVendor" VALUES(1,1,1);
INSERT INTO "ItemsByVendor" VALUES(2,1,2);
INSERT INTO "ItemsByVendor" VALUES(3,2,3);
INSERT INTO "ItemsByVendor" VALUES(4,2,4);
INSERT INTO "ItemsByVendor" VALUES(5,3,6);
INSERT INTO "ItemsByVendor" VALUES(6,3,5);
DROP TABLE IF EXISTS "PurchaseOrder";
CREATE TABLE "PurchaseOrder" ("PurchaseID" INTEGER PRIMARY KEY ,"CustomerID" INTEGER,"ItemID" INTEGER,"Quantity" INTEGER,"PurchaseDate" DATETIME DEFAULT (null) , "ReceivedDate" DATETIME);
INSERT INTO "PurchaseOrder" VALUES(1,2,1,2,'02-01-2018','02-10-2018');
INSERT INTO "PurchaseOrder" VALUES(2,2,3,1,'02-09-2018','02-19-2018');
INSERT INTO "PurchaseOrder" VALUES(3,1,2,3,'03-04-2018','03-19-2018');
INSERT INTO "PurchaseOrder" VALUES(4,4,4,5,'05-04-2018','05-20-2018');
INSERT INTO "PurchaseOrder" VALUES(5,3,6,4,'05-10-2018','05-15-2018');
INSERT INTO "PurchaseOrder" VALUES(6,3,5,1,'07-26-2018','08-04-2018');
INSERT INTO "PurchaseOrder" VALUES(7,2,6,3,'08-12-2018','08-24-2018');
DROP TABLE IF EXISTS "Vendor";
CREATE TABLE "Vendor" ("VendorID" INTEGER PRIMARY KEY  NOT NULL ,"VendorName" VARCHAR NOT NULL  DEFAULT (null) ,"VendorAddress" VARCHAR NOT NULL  DEFAULT (null) );
INSERT INTO "Vendor" VALUES(1,'Microsoft','Washington');
INSERT INTO "Vendor" VALUES(2,'Google','California');
INSERT INTO "Vendor" VALUES(3,'IBM','New York');
DROP TABLE IF EXISTS "__sm_ext_mgmt";
CREATE TABLE __sm_ext_mgmt (`id` integer primary key, `type` text not null , `value` text);
INSERT INTO "__sm_ext_mgmt" VALUES(2,'OnConnectSql','PRAGMA foreign_keys=ON;');
INSERT INTO "__sm_ext_mgmt" VALUES(10,'QueryHistory','SELECT * FROM Customer');
INSERT INTO "__sm_ext_mgmt" VALUES(11,'QueryHistory','ALTER TABLE Customer ADD COLUMN parent_id INTEGER ');
INSERT INTO "__sm_ext_mgmt" VALUES(12,'QueryHistory','ALTER TABLE Customer ADD COLUMN parent_id_id INTEGER REFERENCES Vendor(VendorID)');
INSERT INTO "__sm_ext_mgmt" VALUES(13,'QueryHistory','ALTER TABLE "Order" ADD COLUMN CustomerID REFERENCES Customer(CustomerID)');
INSERT INTO "__sm_ext_mgmt" VALUES(14,'QueryHistory','ALTER TABLE "Order" ADD COLUMN CustomerID1 REFERENCES "Customer" (CustomerID)');
INSERT INTO "__sm_ext_mgmt" VALUES(15,'QueryHistory','CREATE TABLE Order1 (OrderID INTEGER PRIMARY KEY,
Quantity INTEGER,
CustomerID  INTEGER REFERENCES Customer (CustomerID),
VendorID INTEGER REFERENCES Vendor (VendorID))');
INSERT INTO "__sm_ext_mgmt" VALUES(17,'QueryHistory','SELECT Vendor.Name
FROM Vendor

');
INSERT INTO "__sm_ext_mgmt" VALUES(25,'QueryHistory','SELECT * FROM Billgates');
INSERT INTO "__sm_ext_mgmt" VALUES(26,'QueryHistory','Select *
From Purchase
');
INSERT INTO "__sm_ext_mgmt" VALUES(27,'QueryHistory','Select OrderID
From Purchase
');
INSERT INTO "__sm_ext_mgmt" VALUES(28,'QueryHistory','Select Purchase.OrderID
From Purchase
');
INSERT INTO "__sm_ext_mgmt" VALUES(29,'QueryHistory','Select Purchase.OrderID, Vendor.VendorID
From Purchase, Vendor
');
INSERT INTO "__sm_ext_mgmt" VALUES(31,'QueryHistory','Select Purchase.OrderID, Vendor.Name
From Purchase, Vendor');
INSERT INTO "__sm_ext_mgmt" VALUES(32,'QueryHistory','Select Purchase.OrderID, Vendor.Name
From Purchase
Join Vendor On Vendor.VendorID = Purchase.IDVendor');
INSERT INTO "__sm_ext_mgmt" VALUES(33,'QueryHistory','Select Purchase.OrderID, Vendor.Name
From Vendor
Join Purchase On Vendor.VendorID = Purchase.IDVendor');
INSERT INTO "__sm_ext_mgmt" VALUES(34,'QueryHistory','Select Purchase.OrderID, Vendor.Name
From Vendor
Join Purchase On  Purchase.IDVendor = Vendor.VendorID');
INSERT INTO "__sm_ext_mgmt" VALUES(35,'QueryHistory','Select Purchase.OrderID, Vendor.Name
From Vendor
Join Purchase on  Purchase.IDVendor = Vendor.VendorID');
INSERT INTO "__sm_ext_mgmt" VALUES(36,'QueryHistory','Select Purchase.OrderID, Vendor.Name, Customer.Name
From Vendor
Join Purchase on  Purchase.IDVendor = Vendor.VendorID
Join Customer on  Purchase.CustomerID= Customer.CustomerID');
INSERT INTO "__sm_ext_mgmt" VALUES(37,'QueryHistory','Select Purchase.OrderID, Vendor.VendorName as Name, Customer.CustomerName
From Vendor
Join Purchase on  Purchase.VendorID = Vendor.VendorID
Join Customer on  Purchase.CustomerID= Customer.CustomerID');
INSERT INTO "__sm_ext_mgmt" VALUES(38,'QueryHistory','Select Purchase.OrderID, Vendor.VendorName as Vendor_Name, Customer.CustomerName 
From Vendor
Join Purchase on  Purchase.VendorID = Vendor.VendorID
Join Customer on  Purchase.CustomerID= Customer.CustomerID');
INSERT INTO "__sm_ext_mgmt" VALUES(39,'QueryHistory','Select Purchase.OrderID, Customer.CustomerName, Vendor.VendorName as Vendor_Name
From Vendor
Join Purchase on  Purchase.VendorID = Vendor.VendorID
Join Customer on  Purchase.CustomerID= Customer.CustomerID');
INSERT INTO "__sm_ext_mgmt" VALUES(40,'QueryHistory','CREATE TABLE ItemsByVendor ( VendorID  INTEGER REFERENCES Vendor (VendorID), ItemID INTEGER REFERENCES Item (ItemID))');
INSERT INTO "__sm_ext_mgmt" VALUES(41,'QueryHistory','CREATE TABLE ItemsByVendor1 ( ID INTEGER PRIMARY KEY , VendorID  INTEGER REFERENCES Vendor (VendorID), ItemID INTEGER REFERENCES Item (ItemID))');
INSERT INTO "__sm_ext_mgmt" VALUES(42,'QueryHistory','SELECT Vendor.VendorName, Item.Name as ItemName
FROM Vendor
JOIN Item on Item.ItemID = ItemsByVendor.ItemID
JOIN ItemsByVendor on Vendor.VendorID = ItemsByVendor.VendorID');
INSERT INTO "__sm_ext_mgmt" VALUES(43,'QueryHistory','SELECT Vendor.VendorName, Item.Name as ItemName
FROM Vendor
JOIN Item on Item.ItemID = ItemsByVendor.ItemID
JOIN ItemsByVendor on Vendor.VendorID = ItemsByVendor.VendorID
WHERE Vendor.VendorName LIKE ''Google''');
INSERT INTO "__sm_ext_mgmt" VALUES(47,'QueryHistory','ALTER TABLE Purchase ADD COLUMN 
ItemID INTEGER REFERENCES Item (ItemID)');
INSERT INTO "__sm_ext_mgmt" VALUES(53,'QueryHistory','CREATE TABLE Purchase1 (PurchaseID INTEGER PRIMARY KEY,
CustomerID  INTEGER REFERENCES Customer (CustomerID),
ItemID INTEGER REFERENCES Item (ItemID),
Quantity INTEGER,
VendorID INTEGER REFERENCES Vendor (VendorID),
Date DATETIME)');
INSERT INTO "__sm_ext_mgmt" VALUES(58,'QueryHistory','SELECT Vendor.VendorName, Item.Name as ItemName
FROM Vendor
JOIN Item on Item.ItemID = ItemsByVendor.ItemID
JOIN ItemsByVendor on Vendor.VendorID = ItemsByVendor.VendorID');
INSERT INTO "__sm_ext_mgmt" VALUES(62,'QueryHistory','SELECT Vendor.VendorName, Item.Name as ItemName
FROM Vendor
JOIN Item on Item.ItemID = ItemsByVendor.ItemID
JOIN ItemsByVendor on Vendor.VendorID = ItemsByVendor.VendorID
WHERE Vendor.VendorName LIKE ''Google''
');
INSERT INTO "__sm_ext_mgmt" VALUES(63,'QueryHistory','SELECT Vendor.VendorName, Item.Name as ItemName
FROM Vendor
JOIN Item on Item.ItemID = ItemsByVendor.ItemID
JOIN ItemsByVendor on Vendor.VendorID = ItemsByVendor.VendorID
WHERE Item.Name LIKE ''Cloud Instance''
');
INSERT INTO "__sm_ext_mgmt" VALUES(64,'QueryHistory','SELECT  Item.Name as ItemName, Vendor.VendorName
FROM Vendor
JOIN Item on Item.ItemID = ItemsByVendor.ItemID
JOIN ItemsByVendor on Vendor.VendorID = ItemsByVendor.VendorID
WHERE Item.Name LIKE ''Cloud Instance''
');
INSERT INTO "__sm_ext_mgmt" VALUES(65,'QueryHistory','SELECT  CustomerAddress
FROM Customer
WHERE CustomerName LIKE ''Cali%''
');
INSERT INTO "__sm_ext_mgmt" VALUES(66,'QueryHistory','SELECT  CustomerName
FROM Customer
WHERE CustomerAddress LIKE ''Cali%''
');
INSERT INTO "__sm_ext_mgmt" VALUES(67,'QueryHistory','SELECT  Item.Name as ItemName, Vendor.VendorName
FROM Vendor
JOIN Item on Item.ItemID = ItemsByVendor.ItemID
JOIN ItemsByVendor on Vendor.VendorID = ItemsByVendor.VendorID
WHERE Item.Name LIKE ''Cloud Instance''');
INSERT INTO "__sm_ext_mgmt" VALUES(68,'QueryHistory','SELECT  Item.Name as ItemName, Vendor.VendorName
FROM Vendor
JOIN Item on Item.ItemID = ItemsByVendor.ItemID
JOIN ItemsByVendor on Vendor.VendorID = ItemsByVendor.VendorID
WHERE Item.Name LIKE ''Cloud Instance'' AND Vendor.VendorName LIKE ''Google''');
INSERT INTO "__sm_ext_mgmt" VALUES(69,'QueryHistory','SELECT  Item.Name as ItemName, Vendor.VendorName, SUM(Purchase.Quantity)
FROM Purchase
Join Vendor on Purchase.PurchaseID = Vendor.VendorID
JOIN Item on Item.ItemID = ItemsByVendor.ItemID
JOIN ItemsByVendor on Vendor.VendorID = ItemsByVendor.VendorID
WHERE Item.Name LIKE ''Cloud Instance'' AND Vendor.VendorName LIKE ''Google''');
INSERT INTO "__sm_ext_mgmt" VALUES(70,'QueryHistory','SELECT  Item.Name as ItemName, Vendor.VendorName, SUM(Purchase.Quantity) as Total
FROM Purchase
Join Vendor on Purchase.PurchaseID = Vendor.VendorID
JOIN Item on Item.ItemID = ItemsByVendor.ItemID
JOIN ItemsByVendor on Vendor.VendorID = ItemsByVendor.VendorID
WHERE Item.Name LIKE ''Cloud Instance'' AND Vendor.VendorName LIKE ''Google''');
INSERT INTO "__sm_ext_mgmt" VALUES(72,'QueryHistory','INSERT INTO Purchase ( PurchaseID, CustomerID,ItemID,Quantity,VendorID,Date)
VALUES
 (7,1,2,1,2,07-29-2018)');
INSERT INTO "__sm_ext_mgmt" VALUES(84,'QueryHistory','SELECT * FROM Purchase');
INSERT INTO "__sm_ext_mgmt" VALUES(85,'QueryHistory','INSERT INTO Purchase ( PurchaseID, CustomerID,ItemID,Quantity,VendorID,Date)
VALUES (8,2,2,1,2,07-29-2018)');
INSERT INTO "__sm_ext_mgmt" VALUES(86,'QueryHistory','INSERT INTO Purchase ( PurchaseID, CustomerID,ItemID,Quantity,VendorID,Date)
VALUES (9,2,2,1,2,"07-29-2018")');
INSERT INTO "__sm_ext_mgmt" VALUES(87,'QueryHistory','select exists(
    select 1
    from Purchase
    where PurchaseID= 10
)');
INSERT INTO "__sm_ext_mgmt" VALUES(88,'QueryHistory','select exists(
    select 1
    from Purchase
    where PurchaseID= 4
)');
INSERT INTO "__sm_ext_mgmt" VALUES(89,'QueryHistory','select exists(
    select 1
    from Purchase
    where PurchaseID = 4
)');
INSERT INTO "__sm_ext_mgmt" VALUES(90,'QueryHistory','select exists(
    select 0
    from Purchase
    where PurchaseID = 4
)');
INSERT INTO "__sm_ext_mgmt" VALUES(91,'QueryHistory','select exists(
    select 2
    from Purchase
    where PurchaseID = 4
)');
INSERT INTO "__sm_ext_mgmt" VALUES(92,'QueryHistory','
    select 1
    from Purchase
    where PurchaseID = 4
');
INSERT INTO "__sm_ext_mgmt" VALUES(93,'QueryHistory','select 2
from Purchase
where PurchaseID = 4
');
INSERT INTO "__sm_ext_mgmt" VALUES(94,'QueryHistory','select 10
from Purchase
where PurchaseID = 4
');
INSERT INTO "__sm_ext_mgmt" VALUES(95,'QueryHistory','select exists(
    select 1
    from Purchase
    where PurchaseID = 4
)');
INSERT INTO "__sm_ext_mgmt" VALUES(96,'QueryHistory','select exists(
    select 1
    from Purchase
    where PurchaseID = 0
)');
INSERT INTO "__sm_ext_mgmt" VALUES(97,'QueryHistory','SELECT Vendor.VendorName, Item.Name as ItemName, Item.ItemPrice
FROM Vendor
JOIN Item on Item.ItemID = ItemsByVendor.ItemID
JOIN ItemsByVendor on Vendor.VendorID = ItemsByVendor.VendorID
WHERE Vendor.VendorName LIKE ''Google''');
INSERT INTO "__sm_ext_mgmt" VALUES(98,'QueryHistory','SELECT Customer.CustomerName, Customer.CustomerAddress, Purchase.Quantity
FROM Customer
JOIN Purchase on Purchase.CustomerID = Customer.CustomerID
');
INSERT INTO "__sm_ext_mgmt" VALUES(99,'QueryHistory','SELECT Customer.CustomerName, Customer.CustomerAddress, Purchase.Quantity
FROM Customer
JOIN Purchase on Purchase.CustomerID = Customer.CustomerID
JOIN Item on Item.ItemID = Purchase.ItemID
WHERE Item.Name LIKE ''Pix%''');
INSERT INTO "__sm_ext_mgmt" VALUES(100,'QueryHistory','SELECT Customer.CustomerName, Customer.CustomerAddress, Purchase.Quantity
FROM Customer
JOIN Purchase on Purchase.CustomerID = Customer.CustomerID
JOIN Item on Item.ItemID = Purchase.ItemID
WHERE Item.Name LIKE ''Blue%''');
INSERT INTO "__sm_ext_mgmt" VALUES(101,'QueryHistory','SELECT Item.Name as ItemName, Vendor.VendorName, Item.ItemPrice, Purchase.Quantity, Purchase.Date
FROM Item
JOIN Vendor on Vendor .VendorID = ItemsByVendor.VendorID
JOIN ItemsByVendor on ItemsByVendor.ItemID = Vendor .VendorID
JOIN Purchase on Purchase.CustomerID = ItemsByVendor.ItemID
JOIN Customer on  Customer.CustomerID = Purchase.CustomerID
WHERE Customer.CustomerName LIKE ''Musk''');
INSERT INTO "__sm_ext_mgmt" VALUES(102,'QueryHistory','SELECT Item.Name as ItemName, Vendor.VendorName, Item.ItemPrice, Purchase.Quantity, Purchase.Date
FROM Item
JOIN Vendor on Vendor .VendorID = ItemsByVendor.VendorID
JOIN ItemsByVendor on ItemsByVendor.ItemID = Vendor .VendorID
JOIN Purchase on Purchase.CustomerID = ItemsByVendor.ItemID
JOIN Customer on  Customer.CustomerID = Purchase.CustomerID
');
INSERT INTO "__sm_ext_mgmt" VALUES(103,'QueryHistory','SELECT Item.Name as ItemName, Vendor.VendorName, Item.ItemPrice, Purchase.Quantity, Purchase.Date
FROM Item



JOIN Vendor on Vendor .VendorID = ItemsByVendor.VendorID
JOIN ItemsByVendor on ItemsByVendor.VendorID = Vendor .VendorID
JOIN Purchase on Purchase.CustomerID = ItemsByVendor.ItemID
JOIN Customer on  Customer.CustomerID = Purchase.CustomerID
WHERE Customer.CustomerName LIKE ''Musk''');
INSERT INTO "__sm_ext_mgmt" VALUES(104,'QueryHistory','SELECT Item.Name as ItemName, Vendor.VendorName, Item.ItemPrice, Purchase.Quantity, Purchase.Date
FROM Item
JOIN Vendor on Vendor .VendorID = ItemsByVendor.VendorID
JOIN ItemsByVendor on ItemsByVendor.VendorID = Vendor .VendorID
JOIN Purchase on Purchase.CustomerID = ItemsByVendor.ItemID
JOIN Customer on  Customer.CustomerID = Purchase.CustomerID
WHERE Customer.CustomerName LIKE ''Musk''');
INSERT INTO "__sm_ext_mgmt" VALUES(105,'QueryHistory','SELECT Item.Name as ItemName, Vendor.VendorName, Item.ItemPrice, Purchase.Quantity, Purchase.Date
FROM Item
JOIN Vendor on Vendor .VendorID = ItemsByVendor.VendorID
JOIN ItemsByVendor on ItemsByVendor.VendorID = Vendor .VendorID
JOIN Purchase on Purchase.CustomerID = ItemsByVendor.ItemID
JOIN Customer on  Customer.CustomerID = Purchase.CustomerID
');
INSERT INTO "__sm_ext_mgmt" VALUES(106,'QueryHistory','SELECT Item.Name as ItemName, Vendor.VendorName, Item.ItemPrice, Purchase.Quantity, Purchase.Date
FROM Item
JOIN Vendor on Vendor .VendorID = ItemsByVendor.VendorID
JOIN ItemsByVendor on ItemsByVendor.VendorID = Vendor .VendorID
JOIN Purchase on Purchase.CustomerID = ItemsByVendor.ItemID
JOIN Customer on  Customer.CustomerID = Purchase.CustomerID
WHERE Customer.CustomerName LIKE ''Musk''');
INSERT INTO "__sm_ext_mgmt" VALUES(107,'QueryHistory','SELECT Customer.CustomerName, Item.Name as ItemName, Vendor.VendorName, Item.ItemPrice, Purchase.Quantity, Purchase.Date
FROM Item
JOIN Vendor on Vendor .VendorID = ItemsByVendor.VendorID
JOIN ItemsByVendor on ItemsByVendor.VendorID = Vendor .VendorID
JOIN Purchase on Purchase.CustomerID = ItemsByVendor.ItemID
JOIN Customer on  Customer.CustomerID = Purchase.CustomerID
WHERE Customer.CustomerName LIKE ''Musk''');
INSERT INTO "__sm_ext_mgmt" VALUES(109,'QueryHistory','SELECT Item.Name as ItemName, Vendor.VendorName, Item.ItemPrice, Purchase.Quantity, Purchase.Date
FROM Item
JOIN Vendor on Vendor .VendorID = ItemsByVendor.VendorID
JOIN ItemsByVendor on ItemsByVendor.VendorID = Vendor .VendorID
JOIN Purchase on Purchase.CustomerID = ItemsByVendor.ItemID
JOIN Customer on  Customer.CustomerID = Purchase.CustomerID
WHERE Customer.CustomerName LIKE ''Musk''');
INSERT INTO "__sm_ext_mgmt" VALUES(110,'QueryHistory','SELECT Item.Name as ItemName, Vendor.VendorName
FROM Item
JOIN ItemsByVendor on ItemsByVendor.ItemID = Item.ItemID
JOIN Vendor on Vendor.VendorID = ItemsByVendor.VendorID
');
INSERT INTO "__sm_ext_mgmt" VALUES(111,'QueryHistory','SELECT Item.Name as ItemName, Vendor.VendorName
FROM Item
JOIN ItemsByVendor on ItemsByVendor.ItemID = Item.ItemID
JOIN Vendor on Vendor.VendorID = ItemsByVendor.VendorID
JOIN Purchase on Purchase.ItemID = ItemsByVendor.ItemID
JOIN Customer on Customer.CustomerID = Purchase.CustomerID
WHERE Customer.CustomerName LIKE "Musk"');
INSERT INTO "__sm_ext_mgmt" VALUES(112,'QueryHistory','SELECT Item.Name as ItemName, Vendor.VendorName, Item.ItemPrice, Purchase.Quantity
FROM Item
JOIN ItemsByVendor on ItemsByVendor.ItemID = Item.ItemID
JOIN Vendor on Vendor.VendorID = ItemsByVendor.VendorID
JOIN Purchase on Purchase.ItemID = ItemsByVendor.ItemID
JOIN Customer on Customer.CustomerID = Purchase.CustomerID
WHERE Customer.CustomerName LIKE "Musk"');
INSERT INTO "__sm_ext_mgmt" VALUES(113,'QueryHistory','SELECT Item.Name as ItemName, Vendor.VendorName, Item.ItemPrice, Purchase.Quantity,  Item.ItemPrice*Purchase.Quantity
FROM Item
JOIN ItemsByVendor on ItemsByVendor.ItemID = Item.ItemID
JOIN Vendor on Vendor.VendorID = ItemsByVendor.VendorID
JOIN Purchase on Purchase.ItemID = ItemsByVendor.ItemID
JOIN Customer on Customer.CustomerID = Purchase.CustomerID
WHERE Customer.CustomerName LIKE "Musk"');
INSERT INTO "__sm_ext_mgmt" VALUES(114,'QueryHistory','SELECT Item.Name as ItemName, Vendor.VendorName, Item.ItemPrice, Purchase.Quantity,  Item.ItemPrice*Purchase.Quantity as ItemSum
FROM Item
JOIN ItemsByVendor on ItemsByVendor.ItemID = Item.ItemID
JOIN Vendor on Vendor.VendorID = ItemsByVendor.VendorID
JOIN Purchase on Purchase.ItemID = ItemsByVendor.ItemID
JOIN Customer on Customer.CustomerID = Purchase.CustomerID
WHERE Customer.CustomerName LIKE "Musk"');
INSERT INTO "__sm_ext_mgmt" VALUES(118,'QueryHistory','SELECT Item.Name as ItemName, Vendor.VendorName, Item.ItemPrice, Purchase.Quantity,  Item.ItemPrice*Purchase.Quantity as ItemSum, SUM(Item.ItemPrice*Purchase.Quantity )
FROM Item
JOIN ItemsByVendor on ItemsByVendor.ItemID = Item.ItemID
JOIN Vendor on Vendor.VendorID = ItemsByVendor.VendorID
JOIN Purchase on Purchase.ItemID = ItemsByVendor.ItemID
JOIN Customer on Customer.CustomerID = Purchase.CustomerID
WHERE Customer.CustomerName LIKE "Musk"');
INSERT INTO "__sm_ext_mgmt" VALUES(119,'QueryHistory','SELECT Item.Name as ItemName, Vendor.VendorName, Item.ItemPrice, Purchase.Quantity,  Item.ItemPrice*Purchase.Quantity as ItemSum
FROM Item
JOIN ItemsByVendor on ItemsByVendor.ItemID = Item.ItemID
JOIN Vendor on Vendor.VendorID = ItemsByVendor.VendorID
JOIN Purchase on Purchase.ItemID = ItemsByVendor.ItemID
JOIN Customer on Customer.CustomerID = Purchase.CustomerID
WHERE Customer.CustomerName LIKE "Musk"');
INSERT INTO "__sm_ext_mgmt" VALUES(120,'QueryHistory','SELECT SUM(Item.ItemPrice*Purchase.Quantity)
FROM Item
JOIN ItemsByVendor on ItemsByVendor.ItemID = Item.ItemID
JOIN Vendor on Vendor.VendorID = ItemsByVendor.VendorID
JOIN Purchase on Purchase.ItemID = ItemsByVendor.ItemID
JOIN Customer on Customer.CustomerID = Purchase.CustomerID
WHERE Customer.CustomerName LIKE "Musk"');
INSERT INTO "__sm_ext_mgmt" VALUES(121,'QueryHistory','SELECT SUM(Item.ItemPrice*Purchase.Quantity) as ItemSum
FROM Item
JOIN ItemsByVendor on ItemsByVendor.ItemID = Item.ItemID
JOIN Vendor on Vendor.VendorID = ItemsByVendor.VendorID
JOIN Purchase on Purchase.ItemID = ItemsByVendor.ItemID
JOIN Customer on Customer.CustomerID = Purchase.CustomerID
WHERE Customer.CustomerName LIKE "Musk"');
INSERT INTO "__sm_ext_mgmt" VALUES(122,'QueryHistory','SELECT Customer.CustomerName, SUM(Item.ItemPrice*Purchase.Quantity) as TotalSum
FROM Item
JOIN ItemsByVendor on ItemsByVendor.ItemID = Item.ItemID
JOIN Vendor on Vendor.VendorID = ItemsByVendor.VendorID
JOIN Purchase on Purchase.ItemID = ItemsByVendor.ItemID
JOIN Customer on Customer.CustomerID = Purchase.CustomerID
WHERE Customer.CustomerName LIKE "Musk"');
INSERT INTO "__sm_ext_mgmt" VALUES(123,'QueryHistory','SELECT Vendor.VendorName, Item.Name as ItemName
FROM Vendor
JOIN Item on Item.ItemID = ItemsByVendor.ItemID
JOIN ItemsByVendor on Vendor.VendorID = ItemsByVendor.VendorID');
INSERT INTO "__sm_ext_mgmt" VALUES(124,'QueryHistory','SELECT Vendor.VendorName, Item.Name as ItemName, Item.ItemPrice
FROM Vendor
JOIN Item on Item.ItemID = ItemsByVendor.ItemID
JOIN ItemsByVendor on Vendor.VendorID = ItemsByVendor.VendorID');
INSERT INTO "__sm_ext_mgmt" VALUES(125,'QueryHistory','SELECT Vendor.VendorName, Item.Name as ItemName, Item.ItemPrice
FROM Vendor
JOIN Item on Item.ItemID = ItemsByVendor.ItemID
JOIN ItemsByVendor on Vendor.VendorID = ItemsByVendor.VendorID
WHERE Vendor.VendorName LIKE ''Google''
');
INSERT INTO "__sm_ext_mgmt" VALUES(126,'QueryHistory','SELECT  CustomerName
FROM Customer
WHERE CustomerAddress LIKE ''Cali%''');
INSERT INTO "__sm_ext_mgmt" VALUES(127,'QueryHistory','SELECT Customer.CustomerName, Customer.CustomerAddress, Purchase.Quantity
FROM Customer
JOIN Purchase on Purchase.CustomerID = Customer.CustomerID
JOIN Item on Item.ItemID = Purchase.ItemID
WHERE Item.Name LIKE ''Blue%''');
INSERT INTO "__sm_ext_mgmt" VALUES(128,'QueryHistory','SELECT Item.Name as ItemName, Vendor.VendorName, Item.ItemPrice, Purchase.Quantity,  Item.ItemPrice*Purchase.Quantity as ItemSum
FROM Item
JOIN ItemsByVendor on ItemsByVendor.ItemID = Item.ItemID
JOIN Vendor on Vendor.VendorID = ItemsByVendor.VendorID
JOIN Purchase on Purchase.ItemID = ItemsByVendor.ItemID
JOIN Customer on Customer.CustomerID = Purchase.CustomerID
WHERE Customer.CustomerName LIKE "Musk"');
INSERT INTO "__sm_ext_mgmt" VALUES(129,'QueryHistory','SELECT Customer.CustomerName, SUM(Item.ItemPrice*Purchase.Quantity) as TotalSum
FROM Item
JOIN ItemsByVendor on ItemsByVendor.ItemID = Item.ItemID
JOIN Vendor on Vendor.VendorID = ItemsByVendor.VendorID
JOIN Purchase on Purchase.ItemID = ItemsByVendor.ItemID
JOIN Customer on Customer.CustomerID = Purchase.CustomerID
WHERE Customer.CustomerName LIKE "Musk"');
INSERT INTO "__sm_ext_mgmt" VALUES(130,'QueryHistory','SELECT  Item.Name as ItemName, Vendor.VendorName
FROM Vendor
JOIN Item on Item.ItemID = ItemsByVendor.ItemID
JOIN ItemsByVendor on Vendor.VendorID = ItemsByVendor.VendorID
WHERE Item.Name LIKE ''G Suite''
');
INSERT INTO "__sm_ext_mgmt" VALUES(131,'QueryHistory','SELECT Vendor.VendorName, Item.Name as ItemName, Item.ItemPrice
FROM Vendor
JOIN Item on Item.ItemID = ItemsByVendor.ItemID
JOIN ItemsByVendor on Vendor.VendorID = ItemsByVendor.VendorID
WHERE Item.Name LIKE ''G Suite''
');
INSERT INTO "__sm_ext_mgmt" VALUES(132,'QueryHistory','SELECT Vendor.VendorName, Item.Name as ItemName, Item.ItemPrice as ItemPrice$
FROM Vendor
JOIN Item on Item.ItemID = ItemsByVendor.ItemID
JOIN ItemsByVendor on Vendor.VendorID = ItemsByVendor.VendorID');
INSERT INTO "__sm_ext_mgmt" VALUES(133,'QueryHistory','SELECT Item.Name as ItemName, Vendor.VendorName, Item.ItemPrice as ItemPrice$, Purchase.Quantity,  Item.ItemPrice*Purchase.Quantity as ItemBill$
FROM Item
JOIN ItemsByVendor on ItemsByVendor.ItemID = Item.ItemID
JOIN Vendor on Vendor.VendorID = ItemsByVendor.VendorID
JOIN Purchase on Purchase.ItemID = ItemsByVendor.ItemID
JOIN Customer on Customer.CustomerID = Purchase.CustomerID
WHERE Customer.CustomerName LIKE "Musk"');
INSERT INTO "__sm_ext_mgmt" VALUES(134,'QueryHistory','SELECT Item.Name as ItemName, Vendor.VendorName, Item.ItemPrice as ItemPrice$, Purchase.Quantity,  Item.ItemPrice*Purchase.Quantity as TotalItemBill$
FROM Item
JOIN ItemsByVendor on ItemsByVendor.ItemID = Item.ItemID
JOIN Vendor on Vendor.VendorID = ItemsByVendor.VendorID
JOIN Purchase on Purchase.ItemID = ItemsByVendor.ItemID
JOIN Customer on Customer.CustomerID = Purchase.CustomerID
WHERE Customer.CustomerName LIKE "Musk"
');
INSERT INTO "__sm_ext_mgmt" VALUES(135,'QueryHistory','SELECT Item.Name as ItemName, Vendor.VendorName, Item.ItemPrice as ItemPrice$, Purchase.Quantity,  Item.ItemPrice*Purchase.Quantity as ItemBill$
FROM Item
JOIN ItemsByVendor on ItemsByVendor.ItemID = Item.ItemID
JOIN Vendor on Vendor.VendorID = ItemsByVendor.VendorID
JOIN Purchase on Purchase.ItemID = ItemsByVendor.ItemID
JOIN Customer on Customer.CustomerID = Purchase.CustomerID
WHERE Customer.CustomerName LIKE "Musk"');
INSERT INTO "__sm_ext_mgmt" VALUES(152,'QueryHistory','SELECT Customer.CustomerName, SUM(Item.ItemPrice*PurchaseOrder.Quantity) as TotalBill$
FROM Item
JOIN ItemsByVendor on ItemsByVendor.ItemID = Item.ItemID
JOIN Vendor on Vendor.VendorID = ItemsByVendor.VendorID
JOIN PurchaseOrder on PurchaseOrder.ItemID = ItemsByVendor.ItemID
JOIN Customer on Customer.CustomerID = PurchaseOrder.CustomerID
WHERE Customer.CustomerName LIKE "Musk"
');
INSERT INTO "__sm_ext_mgmt" VALUES(153,'QueryHistory','SELECT Item.Name as ItemName, Vendor.VendorName, Item.ItemPrice as ItemPrice$, PurchaseOrder.Quantity,  Item.ItemPrice*PurchaseOrder.Quantity as ItemBill$, PurchaseOrder.PurchaseDate, PurchaseOrder.ReceivedDate
FROM Item
JOIN ItemsByVendor on ItemsByVendor.ItemID = Item.ItemID
JOIN Vendor on Vendor.VendorID = ItemsByVendor.VendorID
JOIN PurchaseOrder on PurchaseOrder.ItemID = ItemsByVendor.ItemID
JOIN Customer on Customer.CustomerID = PurchaseOrder.CustomerID
WHERE Customer.CustomerName LIKE "Musk"');
INSERT INTO "__sm_ext_mgmt" VALUES(154,'QueryHistory','SELECT Customer.CustomerName, Customer.CustomerAddress, PurchaseOrder.Quantity, PurchaseOrder.PurchaseDate, PurchaseOrder.ReceivedDate
FROM Customer
JOIN PurchaseOrder on PurchaseOrder.CustomerID = Customer.CustomerID
JOIN Item on Item.ItemID = PurchaseOrder.ItemID
WHERE Item.Name LIKE ''Blue%''');
INSERT INTO "__sm_ext_mgmt" VALUES(155,'QueryHistory','SELECT  CustomerName
FROM Customer
WHERE CustomerAddress LIKE ''Cali%''');
INSERT INTO "__sm_ext_mgmt" VALUES(156,'QueryHistory','SELECT Vendor.VendorName, Item.Name as ItemName, Item.ItemPrice as ItemPrice$
FROM Vendor
JOIN Item on Item.ItemID = ItemsByVendor.ItemID
JOIN ItemsByVendor on Vendor.VendorID = ItemsByVendor.VendorID
WHERE Item.Name LIKE ''G Suite''
');
INSERT INTO "__sm_ext_mgmt" VALUES(157,'QueryHistory','SELECT Vendor.VendorName, Item.Name as ItemName, Item.ItemPrice as ItemPrice$
FROM Vendor
JOIN Item on Item.ItemID = ItemsByVendor.ItemID
JOIN ItemsByVendor on Vendor.VendorID = ItemsByVendor.VendorID
WHERE Vendor.VendorName LIKE ''Google''');
INSERT INTO "__sm_ext_mgmt" VALUES(158,'QueryHistory','SELECT Vendor.VendorName, Item.Name as ItemName, Item.ItemPrice as ItemPrice$
FROM Vendor
JOIN Item on Item.ItemID = ItemsByVendor.ItemID
JOIN ItemsByVendor on Vendor.VendorID = ItemsByVendor.VendorID');
INSERT INTO "__sm_ext_mgmt" VALUES(163,'StructTree:ExpandedCategories','all-master,all-table');
INSERT INTO "__sm_ext_mgmt" VALUES(164,'StructTree:ExpandedObjects','Customer,Item,ItemsByVendor,Vendor');
INSERT INTO "__sm_ext_mgmt" VALUES(165,'StructTree:AttachedDb','[{"seq":2,"name":"POMS2","file":"C:\\Users\\shrke\\Desktop\\POMS - Copy.sqlite"}]');
INSERT INTO "__sm_ext_mgmt" VALUES(166,'Enabled','1');
