-- Exploratory Data Analysis (EDA) -------
-- Exploratory data analysis is done to answer listed questions and aims of this project 

-- Business Questions to Answer 

-- product -----

-- How many unique product lines does the data have?

select *
from sales; 

select product_line
from sales; 

select distinct product_line
from sales;

select count(distinct product_line)
from sales;

-- What is the most common payment method ?

select *
from sales; 

select payment_method
from sales;

select distinct payment_method
from sales;

select count(payment_method)
from sales;

select payment_method,
 count(payment_method)
from sales
group by payment_method;

select payment_method,
 count(payment_method) as cnt
from sales
group by payment_method;

select payment_method,
 count(payment_method) as cnt
from sales
group by payment_method
Order by cnt desc;

-- what is the most selling product line?

select *
from sales;

select product_line
 from sales;
 
 select count(product_line)
 from sales;
 
 select product_line,
 count(product_line)
 from sales
 group by product_line;
 
 select product_line,
 count(product_line) as cnt
 from sales
 group by product_line;
 
  select product_line,
 count(product_line) as cnt
 from sales
 group by product_line
 order by cnt Desc;
 
 -- What is the total revenue by month?

select *
from sales;

select month_name, 
total
from sales;

select month_name as month,
sum(total)
from sales
group by month;

select month_name as month,
sum(total) as total_revenue 
from sales
group by month
order by total_revenue desc;

-- What month had the largest COGS?

select *
from sales;

select month_name as month,
cogs
from sales;

select month_name as month,
 sum(cogs)
from sales
group by month;

select month_name as month,
 sum(cogs) as cogs
from sales
group by month
order by cogs desc;

-- what product line had the largest revenue?

select *
from sales;

select product_line as product,
total
from sales;

select product_line as product,
sum(total) as total_revenue
from sales
group by product;

select product_line as product,
sum(total) as total_revenue
from sales
group by product
order by total_revenue desc;

-- what is the city with the largest revenue

select *
from sales;

select city,
total 
from sales;

select city,
sum(total) as total_revenue
from sales
group by city;

select city,
sum(total) as total_revenue
from sales
group by city
order by total_revenue desc;

-- what is the city and branch with the largest revenue

select *
from sales;

select city, branch, 
total
from sales;

select city, branch, 
 sum(total) as total_revenue
from sales
group by city , branch;

select city, branch, 
 sum(total) as total_revenue
from sales
group by city , branch
order by total_revenue desc;

-- what product line the largest VAT?

select *
from sales;

select Product_line as product,
vat
from sales;


select Product_line as product,
sum(vat)
from sales
group by product;
# wrong calculations because its a average vat rate not total vat rate

select Product_line as product,
avg(vat)
from sales
group by product;

select Product_line as product,
avg(vat) as avg_vat
from sales
group by product
order by avg_vat desc;

-- Fetch each product line and add a column to those    product line showing "GOOD", "BAD". Good if its greater than avereage sales

select *
from sales;

select product_line as product,
total
from sales;

select product_line as product,
avg(total) as avg_sales
from sales
group by product;

select avg(total)
from sales;

select round (avg(total) ,2)
from sales;


select product_line as product,
avg(total) as avg_sales,
(case 
     when avg(total) > 322.50 then "Good"
     else "Bad"
     end)
     as performance
from sales
group by product;

select product_line as product,
round (avg(total), 2) as avg_sales,
(case 
     when avg(total) > 322.50 then "Good"
     else "Bad"
     end)
     as performance
from sales
group by product;



alter table sales  ADD column performance varchar (10); 

select *
from sales;

update sales
set performance = (case 
     when total > 322.50 then "Good"
     else "Bad"
     end)
     ;

Alter table sales drop column performanc;

-- which branch sold more products that average product sold?

select *
from sales;

select branch,
quantity 
from sales;

select branch,
sum(quantity) as qty
from sales
group by branch;

select branch, 
sum(quantity) as qty 
from sales
group by branch
having sum(quantity) > (select avg(quantity) from sales);

select branch, 
sum(quantity) as qty 
from sales
group by branch
having sum(quantity) > (select avg(quantity) from sales)
order by qty desc;

select branch, 
sum(quantity) as qty 
from sales
group by branch
having qty > (select avg(quantity) from sales)
order by qty desc;

-- What is the most common product line by gender?

select *
from sales;

select product_line as product,
gender,
quantity
from sales;

select product_line as product,
gender,
sum(quantity) as qty
from sales
group by product, gender;

select product_line as product,
gender,
count(quantity) as qty
from sales
group by gender, product
order by qty desc;

-- what is the average rating of each product line?

select *
from sales;

select product_line as product,
rating
from sales;

select product_line as product,
avg(rating) as avg_rating
from sales
group by product;

select product_line as product,
avg(rating) as avg_rating
from sales
group by product
order by avg_rating desc;

select product_line as product,
round (avg(rating), 2) as avg_rating
from sales
group by product
order by avg_rating desc;