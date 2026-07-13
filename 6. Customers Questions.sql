-- Exploratory Data Analysis (EDA) -------
-- Exploratory data analysis is done to answer listed questions and aims of this project 

-- customer 

--  How many unique customer types does the data have?

select *
from sales;

select distinct customer_type as customer
from sales; 

-- total count of each unique customer types does the data have?

select distinct customer_type as customer,
count( customer_type) as customer_count
from sales
group by customer_type; 

select distinct customer_type as customer,
count( customer_type) as customer_count
from sales
group by customer_type
order by customer_count desc; 

-- How many unique payment methods does the data have?

select *
from sales;

select distinct payment_method as payment
from sales;

-- total number of each of unique payment methods does the date have?

select distinct payment_method as payment,
count(payment_method) as payment_count
from sales
group by payment_method;

select distinct payment_method as payment,
count(payment_method) as payment_count
from sales
group by payment_method
order by payment_count desc;

-- What is the most common customer type?

select distinct customer_type as customer,
count( customer_type) as customer_count
from sales
group by customer_type
order by customer_count desc; 

-- Which customer type buys the most?

select *
from sales;

select customer_type as customer,
count(*) as sales
from sales
group by customer_type;

select customer_type as customer,
count(*) as sales
from sales
group by customer_type
order by sales desc;

-- what is gender of most of the customers ?

select *
from sales;

select gender,
count(*) as gender_cnt
from sales
group by gender;

select gender,
count(*) as gender_cnt
from sales
group by gender
order by gender_cnt desc;

-- What is the gender distribution per branch ?

select *
from sales;

select gender,
branch,
count(*)
from sales
group by gender, branch;

select gender,
branch,
count(*) as cnt_gender
from sales
group by gender, branch
order by branch, cnt_gender;

select gender,
branch,
count(*) as cnt_gender
from sales
group by gender, branch
order by branch, cnt_gender desc;

-- which time of the day do customers give most ratings

select *
from sales;

select time_of_day,
rating
from sales;

 select time_of_day as time,
avg(rating) as most_rating
from sales
group by time_of_day;

select time_of_day as time,
avg(rating) as most_rating
from sales
group by time_of_day
order by most_rating desc;

-- which time of the day do customers give most ratings per branch

select time_of_day as time,
branch,
avg(rating) as most_rating
from sales
group by time_of_day, branch
order by branch, most_rating desc;

-- which day of the week has the best avg ratings 

select *
from sales;

select day_name as day,
rating
from sales;

select day_name as day,
avg(rating) as avg_rating
from sales
group by day_name
order by avg_rating desc;

-- which day of the week has the best average ratings per branch 

select day_name as day,
branch,
avg(rating) as avg_rating
from sales
group by day_name, branch
order by branch, avg_rating desc;

