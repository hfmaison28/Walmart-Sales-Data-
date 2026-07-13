-- Exploratory Data Analysis (EDA) -------
-- Exploratory data analysis is done to answer listed questions and aims of this project 

-- Sales

-- Number of sales made in each time of the day per weekday

select *
from sales;

select time_of_day as time, 
day_name as day, 
quantity
from sales;
# this is also wrong

select time_of_day as time, 
day_name as day, 
count(quantity) as qty
from sales
group by time_of_day, day_name
 ;
# this is wrong quantity is not total sales 

select time_of_day as time, 
day_name as day, 
count(quantity) as qty
from sales
group by time_of_day, day_name
 order by qty desc;
# quantity is not total sales 


select time_of_day as time, 
count(*) as total_sales
from sales
group by time_of_day;

select time_of_day as time, 
count(*) as total_sales
from sales
group by time_of_day
order by total_sales desc;

--  which of the customer types brings the most revenue?

select *
from sales;

select customer_type as customer,
total
from sales;

select customer_type as customer,
sum(total)
from sales
group by customer_type;

select customer_type as customer,
round(sum(total), 2) as most_revenue
from sales
group by customer_type
order by most_revenue desc;

-- which city has the largest tax percent/VAT (Value Added Tax)?

select *
from sales;

select city, 
VAT
from sales;

select city, 
avg(VAT)
from sales
group by city;

select city, 
avg(VAT) as VAT
from sales
group by city
order by VAT desc;

-- Which customer type pays the most in VAT?

select *
from sales;

select customer_type as customer,
vat
from sales;

select customer_type as customer,
avg(vat)
from sales
group by customer_type;

select customer_type as customer,
round (avg(vat), 2) as vat
from sales
group by customer_type
order by vat desc;



