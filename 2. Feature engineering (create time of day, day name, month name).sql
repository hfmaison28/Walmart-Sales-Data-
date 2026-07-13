SELECT *
FROM walmartsales.sales;

-- ---------------Feature Engineering ----------------------------------------------

-- time_of_day

select time
from sales 
;

SELECT
`time`,
 CASE
	WHEN `time` >= '06:00:00' AND `time` < '12:00:00' THEN 'Morning'
        WHEN `time` >= '12:00:00'AND `time` < '18:00:00' THEN 'Afternoon'
        Else 'Evening'
        End As time_of_day
	From sales;
    # this breaks down time table into morning, afternoon and evening
    
    select time
    from sales
    ;
    # i still don't see the time_of_date in the sales table 
    
    alter Table sales ADD column time_of_day varchar(20); 
    # adding a column to the sales table 
    
    select *
    from sales 
    ;
    # time_of_day column is visible but its has null in it 
    
    update sales
    Set time_of_day = (case 
         when `time` between "00:00:00" AND "11:59:59" then "morning"
        when `time` between "12:00:00" AND "17:59:59" then "Afternoon"
        Else "Evening"
        End)
        ;
select time_of_day
from sales
;

-- day_name -------------
select date
from sales
;
# these are dates as its in the sales data

select 
      date,
           dayname(date)
From sales
;
# this is naming the dates on sale for name of the week from sunday to saturday 

alter table sales  ADD column day_name varchar (10); 

select *
from sales; 

select 
      date,
           dayname(date) as day_name
From sales
;

Update sales
set day_name = dayname(date);

select day_name
from sales; 

-- month_name

select date
from sales;

select 
      date,
          monthname(date)
From sales
;
# name of the month of the year using the dates from sales 

select 
      date,
          monthname(date) as month_name
From sales
;

alter table sales  ADD column month_name varchar (10); 

select *
from sales;

update sales 
set month_name = monthname(date);

select *
from sales; 