create table retail_sales(
transactions_id INT PRIMARY KEY,	
sale_date DATE,
sale_time TIME,
customer_id	INT,
gender VARCHAR(15),
age	INT,
category VARCHAR(15),	
quantity INT,
price_per_unit FLOAT,	
cogs FLOAT,
total_sale FLOAT
)

-- DATA CLEANING--

select * from retail_sales
where 
transactions_id is null
or 
sale_date is null
or
sale_time is null
or
gender is null
or 
category is null
or
quantity is null
or
cogs is null
or
total_sale is null;

delete 
from retail_sales
where
transactions_id is null
or 
sale_date is null
or
sale_time is null
or
gender is null
or 
category is null
or
quantity is null
or
cogs is null
or
total_sale is null;

select * from retail_sales;


--DATA EXPLORATION--

select count(*) as total_sales from retail_sales;

Q.1 Distinct CUSTOMERS?
select count(distinct customer_id) as total_sale from retail_sales;

Q.2 HOW MANY CATEGORIES?
select count(distinct category) from retail_sales;

Q.3 WHAT DISTINCT CATEGORIES WE HAVE?
select distinct category from retail_sales;


--DATA ANALYSIS & BUSINESS PROBLEM SOLVING--

Q.1 WRITE A SQL QUERY TO RETRIEVE ALL COLUMNS FOR SALES MADE ON '2022-11-05'.

select *
from retail_sales
where sale_date ='2022-11-05';

Q.2 WRITE A SQL QUERY TO RETRIEVE ALL TRANSACTIONS WHERE THE CATEGORY IS CLOTHING AND THE QUANTITY SOLD IN MORE THAN 4 IN THE MONTH OF NOV-2022.
select *
FROM RETAIL_SALES
where category = 'Clothing'
and
to_char(sale_date, 'YYYY-MM')='2022-11'
and
quantity>= 4;

Q.3 WRITE A SQL QUERY TO CALCULATE THE TOTAL_SALES FOR EACH CATEGORY.
select distinct category,
sum(total_sale),
count(*) as total_orders
from retail_sales
group by 1;

Q.4 WRITE A SQL QUERY TO FIND AVG AGE OF CUSTOMERS WHO PURCHASED ITEMS FROM BEAUTY CATEGORY.
select 
round(avg(age), 2) as avg_age
from retail_sales
where category = 'Beauty';

Q.5 WRITE A SQL QUERY TO FIND ALL TRANSACTIONS WHERE THE TOTAL_SALE IS GREATER THAN 1000.
select * from retail_sales
where total_sale > 1000;

Q.6 WRITE A SQL QUERY TO FIND THE TOTAL NUMBER OF TRANSACTIONS MADE BY EACH GENDER IN EACH CATEGORY.
select
category,
gender,
count(*) as total_trans
from retail_sales
group by category,
gender
ORDER BY 1;
 
Q.7 WRITE A SQL QUERY TO CALCULATE THE AVG SALE FOR EACH MONTH. FIND OUT BEST SELLING MONTH IN EACH YEAR.
select
avg(total_sale),
to_char(sale_date, 'YYYY-MM') as month
from retail_sales
group by 2
Order by 1 DESC;

Q.8 WRITE A SQL QUERY TO FIND THE TOP 5 CUSTOMERS BASED ON THE HIGHEST TOTAL SALES.
select
customer_id,
sum(total_sale) as total_sales
from retail_sales
group by 1
order by 2 desc
limit 5;

Q.9 WRITE A SQL QUERY TO FIND THE NUMBER OF UNIQUE CUSTOMERS WHO PURCHASED ITEMS FROM EACH CATEGORY.
select
category,
count(distinct customer_id) as no_of_unique_cus
from retail_sales
group by category;

Q.10 WRITE A SQL QUERY TO CREATE EACH SHIFT AND NUMBER OF ORDERS.
with hourly_sale
as
(
select *,
case
when extract(hour from sale_time)< 12  then 'Morning'
when extract(hour from sale_time) between 12 and 17 then 'Afternoon'
else 'Evening'
end as shift
from retail_sales
)
select 
shift,
count(*) as total_orders
from hourly_sale
group by shift;

select * from retail_sales;

--END OF PROJECT--

