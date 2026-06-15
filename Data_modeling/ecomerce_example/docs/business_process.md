# Business Process
Business Process Name:Retail Sales Analytics Process

# Description
The system records retail sales transactions where customers purchase products. Each transaction is stored in the fact_sales table and analyzed using dimensions like customer, product category, city, and date.
The goal is to analyze sales performance, customer behavior, product demand, and business trends.

# Process Flow
Customer places order → Product selected → Quantity & price recorded → Total amount calculated → Data stored in fact_sales → Analytics performed

# Business Objectives
Analyze total sales performance
Identify top customers and products
Analyze sales by city and category
Track customer changes (SCD2/SCD3)
Study sales trends over time
Support business decision-making

# Business Events
Customer purchase
Product sale
Transaction recording
Sales amount generation
Customer history updates (SCD)

# Analytical Questions 

These analytical questions analyze the sales data in fact_sales using customer and product dimensions.
Customer Analysis: Identify customers who generate the highest sales based on total sales amount (total_amount).
Product Analysis: Find the most sold products based on total quantity sold.
Overall Sales Analysis: Calculate the total sales amount generated from all transactions.