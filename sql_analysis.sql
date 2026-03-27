select * from train
limit 10;

select count(*) as total_rows from train;


-------Business KPIs------------


--Total Sales

select round(sum(sales),2) as total_sales from train;


--Total orders

select count(distinct "Order ID") as total_orders from train;


--Total Customers

select count(distinct "Customer ID") as total_customers

from train;



------------Customer KPIs-----------


--Average Order Value

select round(sum("Sales") * 1.0 / count(distinct "Order ID"),2) as avg_order_value

from train;


--Sales per Customer

select round(sum("Sales") * 1.0 / count(distinct "Customer ID"),2) as sales_per_customer

from train;


--Orders per Customer

select round(count(distinct "Order ID") * 1.0 / count(distinct "Customer ID"),2) as orders_per_customer

from train;



----------Analytical KPIs------------


--Sales by Category (Which category drives revenue)

select "Category",

       sum("Sales") as total_sales

from train

group by "Category"

order by total_sales desc;


--Sales by Sub-Category (Product-level performance)

select "Category", "Sub-Category",

       sum("Sales") as total_sales

from train

group by "Category", "Sub-Category"

order by "Category", total_sales desc;


--top performing Sub-Category in the highest sales Category

select "Sub-Category",sum("Sales") as total_sales from train

where Category in ("Technology")

group by "Sub-Category"

order by total_sales DESC

limit 1;


--Sales by Region (Geographic performance)

select "Region",

       sum("Sales") as total_sales

from train

group by "Region"

order by total_sales desc;


--Sales by Segment (Consumer vs Corporate behavior)

select "Segment",

       sum("Sales") as total_sales
	   
from train

group by "Segment"

order by total_sales desc;


--Monthly Sales Trend (Growth over time)

select 

    substr("Order Date", 7, 4) || '-' || substr("Order Date", 4, 2) as month,

    sum("Sales") as total_sales

from train

group by month

order by month;


--Top Customers (High-value customers)

select "Customer Name",

       sum("Sales") as total_sales

from train

group by "Customer Name"

order by total_sales desc

limit 5;


--Top Cities (Location-based revenue)

select "City",

       sum("Sales") as total_sales

from train

group by "City"

order by total_sales desc

limit 5;


