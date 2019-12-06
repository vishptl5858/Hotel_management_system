drop database if exists music_store;
CREATE DATABASE music_store;

USE music_store;

CREATE TABLE store
(

	storeid   	INT   			PRIMARY KEY     NOT NULL AUTO_INCREMENT,
	store_name 	VARCHAR(20)     UNIQUE, 
	store_add   VARCHAR(20) 	NOT NULL,
	city        VARCHAR(20)     NOT NULL,
	cell_no     varchar(20)

);

CREATE TABLE sales
(
     salesid      INT       PRIMARY KEY NOT NULL AUTO_INCREMENT,
     dateofsales  DATE
);


CREATE TABLE employee
(
	empid        INT      		  PRIMARY KEY NOT NULL AUTO_INCREMENT,
    firstname    VARCHAR(20)      UNIQUE,
    lastname     VARCHAR(20)      UNIQUE,
    address      VARCHAR(20),
	city         VARCHAR(20),
	postalcode   VARCHAR(20),
	cellno       varchar(20),
	username     VARCHAR(20),
	password     VARCHAR(20),	
    salesid	     INT,
	storeid      INT,  
  
    
CONSTRAINT employee_fk_store FOREIGN KEY(storeid) REFERENCES store(storeid)
 );
 
 CREATE TABLE album
 (
	albumid      INT       PRIMARY KEY NOT NULL AUTO_INCREMENT,
    title        VARCHAR(20)
 
 );
 
CREATE TABLE inventory
 (
	inventoryid      	INT       	PRIMARY KEY NOT NULL AUTO_INCREMENT,
    inventoryitems   	VARCHAR(20)      UNIQUE,
    itemavability  		VARCHAR(10),      
    itemqun             INT(20),
	storeid      INT, 
    albumid      INT,
    salesid      INT,
CONSTRAINT inventory_fk_store FOREIGN KEY(storeid) REFERENCES store(storeid),
CONSTRAINT album_fk_inventory FOREIGN KEY(albumid) REFERENCES album(albumid),
CONSTRAINT sales_fk_inventory FOREIGN KEY(salesid) REFERENCES sales(salesid)

 );
 CREATE TABLE invoice_details
(
	invoiceid        INT      		  PRIMARY KEY NOT NULL AUTO_INCREMENT,
    invoicedate   	DATE      UNIQUE,
    billingadd     	VARCHAR(20)      UNIQUE,
    billingcity     VARCHAR(20),
	state         VARCHAR(20),
	country      VARCHAR(20),
	postalcode    VARCHAR(20),
	paymentmethod VARCHAR(20)
);


CREATE TABLE products
(
	productid      INT      		  PRIMARY KEY NOT NULL AUTO_INCREMENT,
    albumname    	 VARCHAR(20)      UNIQUE,
    artist   VARCHAR(20),
    songs     VARCHAR(20),
	genres     VARCHAR(20),
	albumid    INT,
    price      DECIMAL (10,2),
    orderid    INT,
    

CONSTRAINT products_fk_album FOREIGN KEY(albumid) REFERENCES album(albumid)    
);
 
 CREATE TABLE orders
(
	orderid      INT      		  PRIMARY KEY NOT NULL AUTO_INCREMENT,
    orderno    	 VARCHAR(20)      UNIQUE,
    orderdate    DATE,
    shipdate     DATE,
	shipname     VARCHAR(20),
	shipadd   	 VARCHAR(20),
	city         VARCHAR(20),
	postalcode   VARCHAR(20),
	shipcountry    VARCHAR(20),	
	invoiceid     INT,
    productid     INT,
    
CONSTRAINT orders_fk_products FOREIGN KEY(productid) REFERENCES products(productid),
CONSTRAINT orders_fk_invoice_details FOREIGN KEY(invoiceid) REFERENCES invoice_details(invoiceid)

);
CREATE TABLE customer
(
	customerid        INT      		  PRIMARY KEY NOT NULL AUTO_INCREMENT,
    firstname    VARCHAR(20)      UNIQUE,
    lastname     VARCHAR(20)      UNIQUE,
    address      VARCHAR(20),
	city         VARCHAR(20),
	postalcode   VARCHAR(20),
	cellno       varchar(20),
	storeid      INT, 
    orderid      INT,
    salesid      INT,
    
CONSTRAINT customer_fk_store FOREIGN KEY(storeid) REFERENCES store(storeid),
CONSTRAINT customer_fk_orders FOREIGN KEY(orderid) REFERENCES orders(orderid),
CONSTRAINT customer_fk_sales FOREIGN KEY(salesid) REFERENCES sales(salesid)

 );
 
CREATE TABLE supplier
 (
	supplierid      	INT       	PRIMARY KEY NOT NULL AUTO_INCREMENT,
	suppliername    VARCHAR(20)      UNIQUE,
    address      VARCHAR(20),
	city         VARCHAR(20),
	postalcode   VARCHAR(20),
	country      VARCHAR(20),
	storeid      INT,  
    albumid      INT,
CONSTRAINT supplier_fk_store FOREIGN KEY(storeid) REFERENCES store(storeid),
CONSTRAINT album_fk_supplier FOREIGN KEY(albumid) REFERENCES album(albumid)

 );
 

CREATE TABLE rental
(
	rentalid      INT       PRIMARY KEY NOT NULL AUTO_INCREMENT,
    rentaldate    DATETIME,
    storeid       INT,
    empid    	INT,
    customerid    INT,
    
	CONSTRAINT rental_fk_store FOREIGN KEY(storeid) REFERENCES store(storeid),
	CONSTRAINT rental_fk_employee FOREIGN KEY(empid) REFERENCES employee(empid),
    CONSTRAINT rental_fk_customer FOREIGN KEY(customerid) REFERENCES customer(customerid)
);





INSERT INTO `music_store`.`album` (`albumid`,`title`) VALUES ('1','glass animal');
INSERT INTO `music_store`.`album` (`albumid`,`title`) VALUES ('2','rapcher');
INSERT INTO `music_store`.`album` (`albumid`,`title`) VALUES ('3','the script');
INSERT INTO `music_store`.`album` (`albumid`,`title`) VALUES ('4','1989 world tour');

INSERT INTO `music_store`.`sales` (`salesid`,`dateofsales`) VALUES ('1','2019-04-12');
INSERT INTO `music_store`.`sales` (`salesid`,`dateofsales`) VALUES ('2','2019-03-15');
INSERT INTO `music_store`.`sales` (`salesid`,`dateofsales`) VALUES ('3','2019-02-22');
INSERT INTO `music_store`.`sales` (`salesid`,`dateofsales`) VALUES ('4','2019-02-01');


INSERT INTO `music_store`.`invoice_details` (`invoiceid`,`invoicedate`, `billingadd`, `billingcity`, `state`, `country`, `postalcode`, `paymentmethod`) VALUES ('1','2019-04-12', 'anand', 'anand', 'gujarat', 'india', '387710', 'cash');
INSERT INTO `music_store`.`invoice_details` (`invoiceid`,`invoicedate`, `billingadd`, `billingcity`, `state`, `country`, `postalcode`, `paymentmethod`) VALUES ('2','2019-03-10', 'vv nagar', 'vv nagar', 'gujarat', 'india', '388810', 'visa');
INSERT INTO `music_store`.`invoice_details` (`invoiceid`,`invoicedate`, `billingadd`, `billingcity`, `state`, `country`, `postalcode`, `paymentmethod`) VALUES ('3','2019-03-22', 'nadiad', 'nadiad', 'gujarat', 'india', '377771', 'master card');
INSERT INTO `music_store`.`invoice_details` (`invoiceid`,`invoicedate`, `billingadd`, `billingcity`, `state`, `country`, `postalcode`, `paymentmethod`) VALUES ('4','2019-02-10', 'baroda', 'anand', 'gujarat', 'india', '388881', 'debit');


INSERT INTO `music_store`.`store` (`storeid`,`store_name`, `store_add`, `city`, `cell_no`) VALUES ('1','DX store', 'mota bazar', 'anand', '1111111111');
INSERT INTO `music_store`.`store` (`storeid`,`store_name`, `store_add`, `city`, `cell_no`) VALUES ('2','SK store', 'nana bazar', 'nadiad', '2222222222');
INSERT INTO `music_store`.`store` (`storeid`,`store_name`, `store_add`, `city`, `cell_no`) VALUES ('3','VH store', 'vv nagar', 'baroda', '3333333333');
INSERT INTO `music_store`.`store` (`storeid`,`store_name`, `store_add`, `city`, `cell_no`) VALUES ('4','saregama', 'anand', 'anand', '4444444444');


INSERT INTO `music_store`.`inventory` (`inventoryid`,`inventoryitems`, `itemavability`, `itemqun`, `storeid`, `albumid`, `salesid`) VALUES ('1','dark side', 'available', '5', '1', '1', '3');
INSERT INTO `music_store`.`inventory` (`inventoryid`,`inventoryitems`, `itemavability`, `itemqun`, `storeid`, `albumid`, `salesid`) VALUES ('2','back in black', 'available', '2', '3', '2', '3');
INSERT INTO `music_store`.`inventory` (`inventoryid`,`inventoryitems`, `itemavability`, `itemqun`, `storeid`, `albumid`, `salesid`) VALUES ('3','born to run', 'available', '6', '2', '3', '4');
INSERT INTO `music_store`.`inventory` (`inventoryid`,`inventoryitems`, `itemavability`, `itemqun`, `storeid`, `albumid`, `salesid`) VALUES ('4','love', 'available', '0', '3', '4', '1');

INSERT INTO `music_store`.`products` (`productid`,`albumname`, `artist`, `songs`, `genres`, `albumid`,  `price`,`orderid`) VALUES ('1','Chainsmoker', 'Chainsmoker', 'Whodoyoulove', 'Rock', '1', '10','3');
INSERT INTO `music_store`.`products` (`productid`,`albumname`, `artist`, `songs`, `genres`, `albumid`,  `price`,`orderid`) VALUES ('2','The Script', 'Bruno Marsh', '6degreeofseperation', 'HipHop', '2', '5','4');
INSERT INTO `music_store`.`products` (`productid`,`albumname`, `artist`, `songs`, `genres`, `albumid`,  `price`,`orderid`) VALUES ('3','Gravity', 'Brunomarsh', 'minded', 'Jazz', '1',  '25.32','2');
INSERT INTO `music_store`.`products` (`productid`,`albumname`, `artist`, `songs`, `genres`, `albumid`,  `price`,`orderid`) VALUES ('4','Diehard', 'Eminem', 'not afraid', 'Rap', '3', '3','5');
INSERT INTO `music_store`.`products` (`productid`,`albumname`, `artist`, `songs`, `genres`, `albumid`,  `price`,`orderid`) VALUES ('5','Hardwork', 'Eminem', 'more love', 'rap', '2', '23','2');


INSERT INTO `music_store`.`orders` (`orderid`,`orderno`, `orderdate`, `shipdate`, `shipname`, `shipadd`, `city`, `postalcode`, `shipcountry`, `invoiceid`,`productid`) VALUES ('2','tt546t5t5', '2019-04-05', '2019-04-10', 'vishvesh', 'thaledi', 'nadiad', '388881', 'india', '1','2');
INSERT INTO `music_store`.`orders` (`orderid`,`orderno`, `orderdate`, `shipdate`, `shipname`, `shipadd`, `city`, `postalcode`, `shipcountry`, `invoiceid`,`productid`) VALUES ('3','wfr4545', '2019-03-08', '2019-03-14', 'prashant', 'umreth', 'anand', '377710', 'india', '3','3');
INSERT INTO `music_store`.`orders` (`orderid`,`orderno`, `orderdate`, `shipdate`, `shipname`, `shipadd`, `city`, `postalcode`, `shipcountry`, `invoiceid`,`productid`) VALUES ('4','g534g57', '2019-02-15', '2019-02-20', 'ajaz', 'vaso', 'nadiad', '345678', 'india', '2','2');
INSERT INTO `music_store`.`orders` (`orderid`,`orderno`, `orderdate`, `shipdate`, `shipname`, `shipadd`, `city`, `postalcode`, `shipcountry`, `invoiceid`,`productid`) VALUES ('5','54654yg', '2019-01-25', '2019-02-01', 'bhargav', 'umreth', 'anand', '123456', 'india', '3','4');

INSERT INTO `music_store`.`customer` (`customerid`,`firstname`, `lastname`, `address`, `city`, `postalcode`, `cellno`, `storeid`, `orderid`, `salesid`) VALUES ('1','Bhargav', 'Patel', 'Motabazar', 'Anand', '388456', '991375656', '1', '4', '1');
INSERT INTO `music_store`.`customer` (`customerid`,`firstname`, `lastname`, `address`, `city`, `postalcode`, `cellno`, `storeid`, `orderid`, `salesid`) VALUES ('3','Jay', 'Bhavsar', 'Nadiad', 'nadiad', '321245', '9825289813', '2', '2', '3');
INSERT INTO `music_store`.`customer` (`customerid`,`firstname`, `lastname`, `address`, `city`, `postalcode`, `cellno`, `storeid`, `orderid`, `salesid`) VALUES ('4','Ankit', 'Parmar', 'vaso', 'nadiad', '365456', '991365824', '3', '3', '1');

INSERT INTO `music_store`.`employee` (`empid`,`firstname`, `lastname`, `address`, `city`, `postalcode`, `cellno`, `username`, `password`, `salesid`, `storeid`) VALUES ('1','Shery', 'Patel', 'motabazar', 'Anand', '321456', '98745623145', 'sherypatel', 'patel89', '1', '2');
INSERT INTO `music_store`.`employee` (`empid`,`firstname`, `lastname`, `address`, `city`, `postalcode`, `cellno`, `username`, `password`, `salesid`, `storeid`) VALUES ('2','Mukul', 'yadav', 'nanabazar', 'Anand', '321456', '997854632', 'patelmukul', 'mukul23', '2', '3');


INSERT INTO `music_store`.`rental` (`rentalid`,`rentaldate`, `storeid`, `empid`, `customerid`) VALUES ('1','2018-07-16', '1', '2', '3');
INSERT INTO `music_store`.`rental` (`rentalid`,`rentaldate`, `storeid`, `empid`, `customerid`) VALUES ('3','2017-06-14', '2', '1', '4');

INSERT INTO `music_store`.`supplier` (`supplierid`,`suppliername`, `address`, `city`, `postalcode`, `country`, `storeid`, `albumid`) VALUES ('1','DK PVT LTD', 'hespler road', 'cambridge', 'N2C456', 'Canada', '1', '2');
INSERT INTO `music_store`.`supplier` (`supplierid`,`suppliername`, `address`, `city`, `postalcode`, `country`, `storeid`, `albumid`) VALUES ('2','GM LIMITED', 'king street', 'kitchnere', 'N2C2R8', 'Canada', '2', '1');
INSERT INTO `music_store`.`supplier` (`supplierid`,`suppliername`, `address`, `city`, `postalcode`, `country`, `storeid`, `albumid`) VALUES ('3','JP PVT LTD', 'highland', 'ottawa', 'N2C2RE', 'Canada', '3', '3');
