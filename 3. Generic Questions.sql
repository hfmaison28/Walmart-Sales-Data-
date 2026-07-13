-- Exploratory Data Analysis (EDA) -------
-- Exploratory data analysis is done to answer listed questions and aims of this project 

-- Business Questions to Answer 

-- Generic Questions 

-- How many unique cities does the data have? how many unique cities contains a walmart

select *
from sales; 

select city
from sales;

select distinct city
from sales; 

--  In which city is each branch?

select *
from sales;

select city, branch
from sales; 

select distinct city, branch
from sales; 

 