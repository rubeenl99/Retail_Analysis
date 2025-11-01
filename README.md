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

All SQL queries used for data preparation and analysis are in the file [`retail_queries.sql`](./retail_queries.sql).

This file contains:

- **Table Creation**: creates `customers` and `sales` tables, including primary and foreign keys.
- **Aggregate Queries**: calculates total sales per customer, total sales per product category, monthly sales, and more.
- **Joins and Groupings**: combines sales with customer demographic data to analyze trends by age and gender.
- **Top Customers Analysis**: identifies the top 5 customers per product category using CTEs and window functions.

**Skills used**: Joins, CTEs, Aggregate Functions, GROUP BY, ORDER BY, Window Functions, CASE Statements, Creating Tables, Foreign Keys, Date Functions.
