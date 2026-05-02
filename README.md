# Elist E-Commerce Business Analysis
Owen Campbell

This project analyzes e-commerce transaction data from Elist using Excel for exploratory analysis and SQL in BigQuery to answer key business questions related to sales performance, delivery times, refunds, and customer behavior.

## Dataset
- Source: Elist e-commerce dataset (Christina Jiang)
- Format: Excel (.xlsx)

### Data Preparation
- Used the `orders_data_clean` worksheet from the Excel file
- Cleaned and structured the data for analysis
- Loaded into BigQuery as the `orders` table

### Key Fields
- purchase_ts: purchase date
- delivery_ts: delivery date
- refund_ts: refund date (if applicable)
- product_name: product purchased
- usd_price: order value
- country_code: customer region
- purchase_platform: website vs mobile
- loyalty_program: 1 (yes) / 0 (no)
- created_on: account creation date

## Business Questions

1. What were the order counts, sales, and AOV for MacBooks in North America by quarter?
2. Which region has the highest average delivery time?
3. What is the refund rate per product?
4. What is the most popular product in each region?
5. How does time to purchase differ between loyalty vs non-loyalty customers?

## Key Insights

### Sales Trends
- Sales peaked in 2020 (+162%), driven by strong order growth
- Declined in 2021 (-10%) and sharply in 2022 (-45%)
- Changes driven primarily by order volume rather than AOV

### Delivery Performance
- Delivery times vary by region, with some regions significantly slower
- Most regions fall within a similar delivery range (~7–10 days), with a few outliers driving higher averages

### Refund Behavior
- Refund rates are relatively low overall
- ThinkPad Laptop has the highest refund rate among products

### Product Popularity
- Apple AirPods are the most frequently purchased product across regions

### Loyalty Program Impact
- Minimal difference in time to purchase between groups (~101 vs ~107 days)
- Loyalty program shows limited impact on purchasing speed

## Tools Used

- Excel (pivot tables)
- Google BigQuery (SQL)
- VS Code
- GitHub

## Project Files

- business_analysis.sql → SQL queries
- elist_transactions_data_pipeline.xlsx → data + pivot analysis
- README.md → project summary

All SQL queries used in this analysis are included in the repository.