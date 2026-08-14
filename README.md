# SQL_Retail_Sales_Analysis_Project

**## Project Overview**
**Project Title** : Retail Sales Analysis
This project is designed to demonstrate SQL skills and techniques typically used by data analysts to explore, clean, and analyze retail sales data. The project involves setting up a retail sales database, performing exploratory data analysis (EDA), and answering specific business questions through SQL queries. 

**## Obective**
1. **Set up retails sales database**: Create and populate a retail sales database with the provided sales data.
2. **Data Cleaning**: Identify and remove any records with missing or null values.
3. **Exploratory Data Analysis (EDA)** : Perform basic exploratory data analysis to understand the dataset.
4. **Business Analysis** : Use SQL to answer specific business questions and derive insights from the sales data.

## **Project Structure**
### 1. Database Setup
- **Database Creation**: The project starts by creating a database named 'SQL-Retail_sales_database'.
- **Table Creation**: A table named 'retail_sales' is created to store the sales data. The table structure included columns for transactions ID, sale date, sale time,	customer ID,	gender,	age,	product category,	quantity sold,	price per unit,	cost of goods sold (cogs) and	total sales amount.

```sql
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
);
```

### **2. DATA CLEANING**

- **Record Count**: Determine the total number of records in the dataset.
- **Customer Count**: Find out how many unique customers are in the dataset.
- **Category Count**: Identify all unique product categories in the dataset.
- **Null Value Checks**: Check for any null values in the dataset and modify the records with missing data.

```sql
select * from retail_sales where 
transactions_id is null or 
sale_date is null or
sale_time is null or
gender is null or 
category is null or
quantity is null or
cogs is null or
total_sale is null;

delete from retail_sales where
transactions_id is null or 
sale_date is null or
sale_time is null or
gender is null or 
category is null or
quantity is null or
cogs is null or
total_sale is null;
```

### 3. DATA ANALYSIS & FINDINGS
The following SQL queries were developed to answer specific business questions:

**Q.1 WRITE A SQL QUERY TO RETRIEVE ALL COLUMNS FOR SALES MADE ON '2022-11-05'.**
```sql
select *from retail_sales
where sale_date ='2022-11-05';
```

**Q.2 WRITE A SQL QUERY TO RETRIEVE ALL TRANSACTIONS WHERE THE CATEGORY IS CLOTHING AND THE QUANTITY SOLD IN MORE THAN 4 IN THE MONTH OF NOV-2022.**
```sql
select * FROM RETAIL_SALES
where category = 'Clothing' and
to_char(sale_date, 'YYYY-MM')='2022-11'and
quantity>= 4;
```

**Q.3 WRITE A SQL QUERY TO CALCULATE THE TOTAL_SALES FOR EACH CATEGORY.**
```sql
select distinct category,
sum(total_sale),
count(*) as total_orders
from retail_sales
group by 1;
```

**Q.4 WRITE A SQL QUERY TO FIND AVG AGE OF CUSTOMERS WHO PURCHASED ITEMS FROM BEAUTY CATEGORY.**
```sql
select 
round(avg(age), 2) as avg_age
from retail_sales
where category = 'Beauty';
```

**Q.5 WRITE A SQL QUERY TO FIND ALL TRANSACTIONS WHERE THE TOTAL_SALE IS GREATER THAN 1000.**
```sql
select * from retail_sales
where total_sale > 1000;
```

**Q.6 WRITE A SQL QUERY TO FIND THE TOTAL NUMBER OF TRANSACTIONS MADE BY EACH GENDER IN EACH CATEGORY.**
```sql
select
category,
gender,
count(*) as total_trans
from retail_sales
group by category,
gender
ORDER BY 1;
```

**Q.7 WRITE A SQL QUERY TO CALCULATE THE AVG SALE FOR EACH MONTH. FIND OUT BEST SELLING MONTH IN EACH YEAR.**
```sql
select
avg(total_sale),
to_char(sale_date, 'YYYY-MM') as month
from retail_sales
group by 2
Order by 1 DESC;
```

**Q.8 WRITE A SQL QUERY TO FIND THE TOP 5 CUSTOMERS BASED ON THE HIGHEST TOTAL SALES.**
```sql
select
customer_id,
sum(total_sale) as total_sales
from retail_sales
group by 1
order by 2 desc
limit 5;
```

**Q.9 WRITE A SQL QUERY TO FIND THE NUMBER OF UNIQUE CUSTOMERS WHO PURCHASED ITEMS FROM EACH CATEGORY.**
```sql
select
category,
count(distinct customer_id) as no_of_unique_cus
from retail_sales
group by category;
```

**Q.10 WRITE A SQL QUERY TO CREATE EACH SHIFT AND NUMBER OF ORDERS.**
```sql
with hourly_sale as
(select *,
case
when extract(hour from sale_time)< 12  then 'Morning'
when extract(hour from sale_time) between 12 and 17 then 'Afternoon'
else 'Evening'
end as shift
from retail_sales)
select 
shift,
count(*) as total_orders
from hourly_sale
group by shift;
```

## Findings
- **Customer Demographics**: The dataset includes customers from various age groups, with sales distributed across different categories such as Clothing and Beauty.
- **High-Value Transactions**: Several transactions had a total sale amount greater than 1080, indicating premium purchases.
- **Sales Trends**: Monthly analysis shows variations in sales, helping identify peak seasons.
- **Customer Insights**: The analysis identifies the top-spending customers and the most popular product categories.

## Reports
- **Sales Summary**: A detailed report summarizing total sales, customer demographics, and category performance.
**Trend Analysises**: Insights into sales trends across different months and shifts.
**Customer Insights**: Reports on top customers and unique customer counts per category.

## Conclusion
This project serves as a comprehensive introduction to SQL for data analysts, covering database setup, data cleaning, exploratory data analysis, and business-driven SQL queries. The findings from this project can help drive business decisions by understanding sales patterns, customer behavior, and product performance.

**--END OF PROJECT--**

