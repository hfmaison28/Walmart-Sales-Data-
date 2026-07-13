Create database if not exists WalmartSales;

Create Table If Not Exists sales (
 invoice_id varchar (30) Not Null Primary Key, 
 branch varchar (5) Not Null, 
 city varchar (30) Not Null, 
 customer_type varchar (30)  Not Null,
 gender varchar (10) Not Null, 
 product_line varchar (100) Not Null, 
 unit_price decimal (10, 2) Not Null, 
 quantity INT NOT NULL, 
 VAT float (6, 4) Not Null, 
 total decimal (12, 4)  Not Null,
 date datetime Not Null, 
 time Time NOt NUll,
 payment_method varchar (15) Not Null, 
 cogs decimal (10, 2) Not null,
 gross_margin_pct float(11, 9),
 gross_income decimal (12, 4) Not Null, 
 rating float (2, 1)
 )
 ;
 
 select *
 from walmartsales.sales
 ;
 
 
 