/*
1) You are required to create tables for supplier,customer,category,product,supplier_pricing,order,rating to store the data for the Ecommerce
with the schema definition given below.
*/
create database ecommerce;
use ecommerce;
create table supplier(SUPP_ID int PRIMARY KEY, SUPP_NAME VARCHAR(50) NOT NULL, SUPP_CITY VARCHAR(50) NOT NULL, SUPP_PHONE VARCHAR(50) NOT NULL);
create table customer(CUS_ID int PRIMARY KEY, CUS_NAME VARCHAR(20) NOT NULL, CUS_PHONE VARCHAR(10) NOT NULL, CUS_CITY VARCHAR(30) NOT NULL , CUS_GENDER CHAR);
create table category(CAT_ID int PRIMARY KEY, CAT_NAME VARCHAR(20) NOT NULL);
create table products(PRO_ID int PRIMARY KEY, PRO_NAME VARCHAR(20) NOT NULL default "Dummy",PRO_DESC VARCHAR(60), CAT_ID int,foreign key(CAT_ID) REFERENCES category(CAT_ID));
create table supplier_pricing(PRICING_ID int PRIMARY KEY,PRO_ID int, FOREIGN KEY(PRO_ID) REFERENCES products(PRO_ID), SUPP_ID int default "0", SUPP_PRICE int default "0");
create table orders(ORD_ID int PRIMARY KEY, ORD_AMOUNT int NOT NULL, ORD_DATE DATE NOT NULL, CUS_ID int,PRICING_ID int, FOREIGN KEY(CUS_ID) references customer(CUS_ID), foreign key(PRICING_ID) REFERENCES supplier_pricing(PRICING_ID));
create table rating(RAT_ID int PRIMARY KEY, ORD_ID int, RAT_RATSTARS int NOT NULL,  FOREIGN KEY(ORD_ID) references orders(ORD_ID));

/*
2) Insert the following data in the table created above
*/

insert into supplier values(1,"Rajesh Retails", "Delhi", 1234567890);
insert into supplier values(2,"Appario Ltd.", "Mumbai", 2589631470);
insert into supplier values(3,"Knome products", "Mumbai", 9785462315 );
insert into supplier values(4,"Bansal Retails", "Kochi", 8975463285);
insert into supplier values(5," Mittal Ltd.", "Lucknow", 7898456532);

insert into customer values(1, "Aakash", 9999999999, "Delhi", "M");
insert into customer values(2, "Aman", 9785463214, "Noida", "M");
insert into customer values(3, "Neha", 9999999999, "Mumbai", "F");
insert into customer values(4, "Megha", 6951423202,"Kolkata", "F");
insert into customer values(5, "Pulkit", 4551236525,"Lucknow", "M");

insert into category values(1,"Books");
insert into category values(2,"Games");
insert into category values(3,"Groceries");
insert into category values(4,"Electronics");
insert into category values(5,"Clothes");

insert into products values(1,"GTA V", "Windows 7 and above with i5 processor and 8GB RAM", 2);
insert into products values(2,"TSHIRT", "SIZE-L with Black, Blue and White variations", 5);
insert into products values(3, "ROG LAPTOP", "Windows 10 with 15inch screen, i7 processor, 1TB SSD", 4);
insert into products values(4,"OATS","Highly Nutritious from Nestle",3);
INSERT INTO products VALUES(5,"HARRY POTTER","Best Collection of all time by J.K Rowling",1);
INSERT INTO products VALUES(6,"MILK","1L Toned MIlk",3);
INSERT INTO products VALUES(7,"Boat EarPhones","1.5Meter long Dolby Atmos",4);
INSERT INTO products VALUES(8,"Jeans","Stretchable Denim Jeans with various sizes and color",5);
INSERT INTO products VALUES(9,"Project IGI","compatible with windows 7 and above",2);
INSERT INTO products VALUES(10,"Hoodie","Black GUCCI for 13 yrs and above",5);
INSERT INTO products VALUES(11,"Rich Dad Poor Dad","Written by RObert Kiyosaki",1);
INSERT INTO products VALUES(12,"Train Your Brain","By Shireen Stephen",1);

INSERT INTO supplier_pricing VALUES(1,1,2,1500); 
INSERT INTO supplier_pricing VALUES(2,3,5,30000); 
INSERT INTO supplier_pricing VALUES(3,5,1,3000); 
INSERT INTO supplier_pricing VALUES(4,2,3,2500);
INSERT INTO supplier_pricing VALUES(5,4,1,1000); 
INSERT INTO supplier_pricing VALUES(6,12,2,780); 
INSERT INTO supplier_pricing VALUES(7,12,4,789); 
INSERT INTO supplier_pricing VALUES(8,3,1,31000); 
INSERT INTO supplier_pricing VALUES(9,1,5,1450); 
INSERT INTO supplier_pricing VALUES(10,4,2,999); 
INSERT INTO supplier_pricing VALUES(11,7,3,549); 
INSERT INTO supplier_pricing VALUES(12,7,4,529); 
INSERT INTO supplier_pricing VALUES(13,6,2,105); 
INSERT INTO supplier_pricing VALUES(14,6,1,99); 
INSERT INTO supplier_pricing VALUES(15,2,5,2999); 
INSERT INTO supplier_pricing VALUES(16,5,2,2999);

INSERT INTO orders VALUES(101,1500,"2021-10-06",2,1); 
INSERT INTO orders VALUES(102,1000,"2021-10-12",3,5); 
INSERT INTO orders VALUES(103,30000,"2021-09-16",5,2); 
INSERT INTO orders VALUES(104,1500,"2021-10-05",1,1); 
INSERT INTO orders VALUES(105,3000,"2021-08-16",4,3); 
INSERT INTO orders VALUES(106,1450,"2021-08-18",1,9); 
INSERT INTO orders VALUES(107,789,"2021-09-01",3,7); 
INSERT INTO orders VALUES(108,780,"2021-09-07",5,6); 
INSERT INTO orders VALUES(109,3000,"2021-0-10",5,3); 
INSERT INTO orders VALUES(110,2500,"2021-09-10",2,4); 
INSERT INTO orders VALUES(111,1000,"2021-09-15",4,5); 
INSERT INTO orders VALUES(112,789,"2021-09-16",4,7); 
INSERT INTO orders VALUES(113,31000,"2021-09-16",1,8); 
INSERT INTO orders VALUES(114,1000,"2021-09-16",3,5); 
INSERT INTO orders VALUES(115,3000,"2021-09-16",5,3); 
INSERT INTO orders VALUES(116,99,"2021-09-17",2,14);

INSERT INTO rating VALUES(1,101,4);
INSERT INTO rating VALUES(2,102,3);
INSERT INTO rating VALUES(3,103,1);
INSERT INTO rating VALUES(4,104,2);
INSERT INTO rating VALUES(5,105,4);
INSERT INTO rating VALUES(6,106,3);
INSERT INTO rating VALUES(7,107,4);
INSERT INTO rating VALUES(8,108,4);
INSERT INTO rating VALUES(9,109,3);
INSERT INTO rating VALUES(10,110,5); 
INSERT INTO rating VALUES(11,111,3);
INSERT INTO rating VALUES(12,112,4);
INSERT INTO rating VALUES(13,113,2);
INSERT INTO rating VALUES(14,114,1);
INSERT INTO rating VALUES(15,115,1);
INSERT INTO rating VALUES(16,116,2);

/*
  3) Display the total number of customers based on gender who have placed orders of worth at least Rs.3000.
*/

SELECT c.CUS_GENDER as Gender, count((c.CUS_ID)) as Count
FROM customer AS c
join orders AS o 
on c.CUS_ID = o.CUS_ID
AND o.ORD_AMOUNT >= 3000
GROUP BY c.CUS_GENDER;
/*
  4) Display all the orders along with product name ordered by a customer having Customer_Id=2
*/

select o.ORD_ID  as Order_ID, o.ORD_AMOUNT as Amount,o.ORD_DATE as Order_Date, sp.PRO_ID as Product_ID, p.PRO_NAME as Product_Name
from orders o 
inner join supplier_pricing sp
ON o.PRICING_ID = sp.PRICING_ID
inner Join products p 
ON p.PRO_ID = sp.PRO_ID
where o.CUS_ID = 2;

/*
5) Display the Supplier details who can supply more than one product.
*/

select * from supplier
where SUPP_ID IN (
select SUPP_ID FROM supplier_pricing
GROUP BY (SUPP_ID)
HAVING count(SUPP_ID)> 1);

/*
6) Find the least expensive product from each category and print the table with category id, name, product name and price of the product.
*/

select cat.CAT_ID, min(t2.SUPP_PRICE)  AS MIN_PRICE from category as cat inner join
(select * from products inner join 
(select PRO_ID as Product_ID , SUPP_PRICE from supplier_pricing group by Product_ID HAVING MIN(SUPP_PRICE)) as T1 ON T1.Product_ID = products.PRO_ID ) as T2
ON T2.CAT_ID = cat.CAT_ID
group by (cat.cat_id);

/*
7) Display the Id and Name of the Product ordered after “2021-10-05”.
*/

select T1.pro_id AS product_id, products.pro_name as product_name  from products inner join 
(select o.ORD_DATE, sp.pro_id  from orders o inner join supplier_pricing sp
ON sp.pricing_id = o.pricing_id
AND o.ORD_DATE > '2021-10-05') AS T1 
ON T1.pro_id = products.pro_id;


/*8) 
Display customer name and gender whose names start or end with character 'A'.
*/

SELECT cus_name , cus_gender
from customer
where cus_name like 'A%' or cus_name like '%A'


/* 

9.Create a stored procedure to display supplier id, name, rating and Type_of_Service.
 For Type_of_Service, If rating =5, print “Excellent Service”,If rating >4 print “Good Service”, If rating >2 print “Average Service” 
 else print “Poor Service”.
Tables: Ratings ->Orders ->Supplier_Pricing

*/


DELIMITER &&
CREATE PROCEDURE proc()
BEGIN
SELECT report.supp_id, report.supp_name, report.average,
CASE
	WHEN report.average = 5 THEN 'Excellent Service'
	WHEN report.average > 4 THEN 'Good Service'
	WHEN report.average > 2 THEN 'Average Service'
    ELSE 'Poor Service'
END as Type_of_Service FROM
(SELECT test03.SUPP_ID, supplier.SUPP_NAME, test03.Average from
(SELECT test02.SUPP_ID, sum(test02.RAT_RATSTARS)/count(test02.RAT_RATSTARS) as Average from
(SELECT supplier_pricing.SUPP_ID, test01.ORD_ID, test01.RAT_RATSTARS FROM supplier_pricing inner join
(SELECT orders.PRICING_ID, rating.ORD_ID, rating.RAT_RATSTARS
FROM orders INNER JOIN rating ON rating.ORD_ID = orders.ORD_ID
) AS test01 ON test01.PRICING_ID = supplier_pricing.PRICING_ID)
AS test02 group by test02.SUPP_ID)
AS test03 inner join supplier where test03.SUPP_ID = supplier.SUPP_ID) AS report;
END &&
DELIMITER ;

call proc();
