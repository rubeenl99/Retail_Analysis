# Retail_Analysis
## Introduction

This project analyzes sales and customer data from a fictional retail company. The dataset consists of two main tables:

- **Sales**: contains transaction data including `Transaction ID`, `Date`, `Customer ID`, `Product Category`, `Quantity`, `Price per Unit`, and `Total Amount`.
- **Customers**: contains demographic information of customers such as `Customer ID`, `Gender`, and `Age`.

The main goal of this project is to explore sales performance by product and over time. The analysis identifies top-performing products and highlights trends in sales. It also provides insights into customer behavior based on gender and age groups.

To carry out this analysis, the following tools and technologies were used:

- **SQL**: for data extraction, aggregation, and manipulation.
- **Python** (pandas, SQLAlchemy): for advanced data preparation, customer segmentation, and generating datasets for visualization.
- **Power BI**: to create interactive dashboards and visualize key performance indicators (KPIs).

## SQL Analysis

All SQL queries used for data preparation and analysis are in the file [`retail_data.sql`](./retail_data.sql).

This file contains:

- **Table Creation**: creates `customers` and `sales` tables, including primary and foreign keys.
- **Aggregate Queries**: calculates total sales per customer, total sales per product category, monthly sales, and more.
- **Joins and Groupings**: combines sales with customer demographic data to analyze trends by age and gender.
- **Top Customers Analysis**: identifies the top 5 customers per product category using CTEs and window functions.

**Skills used**: Joins, CTEs, Aggregate Functions, GROUP BY, ORDER BY, Window Functions, CASE Statements, Creating Tables, Foreign Keys, Date Functions.

## Python Analysis

All Python scripts used for data extraction, cleaning, and analysis are included in the notebook [`retail_analysis.ipynb`](./retail_analysis.ipynb).

After extracting the data from the MySQL database, Python was used to:

- Merge the `sales` and `customers` tables.
- Create additional columns such as `Month` and `AgeGroup`.
- Segment customers into Low, Medium, and High spending categories.
- Prepare datasets for visualizations.

**Key Insights from Visualizations**:

- **Total Sales by Product Category**: Electronics is the top-selling category.
- **Monthly Sales Trends**: December shows the highest total sales.
- **Customer Segments by Spending**: Customers segmented into Low, Medium, and High spenders.
- **Sales by Gender and Age Group**: Most sales come from customers aged **35-49** and **+50**, with similar contributions from males and females.  

**Exported Data for Power BI**:

- `customer_segment.csv`
- `sales_by_month_category.csv`
- `ranking_products.csv`
- `monthly_sales.csv`
- `age_gender_sales.csv`

**Skills used**: Data extraction from SQL, Data cleaning and preparation, Merging datasets, Creating new features/columns, Customer segmentation, Grouping and aggregation (GROUP BY), Data visualization with matplotlib and seaborn, Exporting CSV files.
