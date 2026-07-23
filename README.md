# 🍽️ Zomato Business Intelligence Dashboard
Interactive Business Intelligence Dashboard built using **Tableau**, **SQL**, and **Python** to analyze restaurant performance, customer preferences, ratings, cuisines, online ordering trends, and booking behavior.

![Tableau](https://img.shields.io/badge/Tableau-Public-E97627?style=for-the-badge&logo=Tableau)
![Python](https://img.shields.io/badge/Python-3.11-blue?style=for-the-badge&logo=python)
![MySQL](https://img.shields.io/badge/MySQL-Database-blue?style=for-the-badge&logo=mysql)
![SQL](https://img.shields.io/badge/SQL-Analytics-success?style=for-the-badge)
![License](https://img.shields.io/badge/License-MIT-green?style=for-the-badge)

---

## 📷 Dashboard Preview

![Dashboard Overview](Screenshots/dashboard_overview.png)

---

## 🎯 Project Overview

This project transforms raw Zomato restaurant data into an interactive Business Intelligence dashboard.

The dashboard helps answer questions like:

- Which locations have the highest restaurant ratings?
- Which restaurant types are most popular?
- Which cuisines dominate the market?
- How many restaurants provide Online Ordering?
- How many restaurants support Table Booking?
- Which restaurants receive the highest customer votes?

---

## 📊 Dashboard KPIs

| KPI | Value |
|------|-------|
| 🍽 Total Restaurants | 8,743 |
| ⭐ Average Rating | 3.65 |
| 👍 Total Customer Votes | 14.67 Million |
| 💰 Average Cost for Two | ₹497 |

---

## 📈 Dashboard Features

- Interactive Filters
- Location-wise Rating Analysis
- Restaurant Type Distribution
- Cuisine Popularity Analysis
- Online Order Availability
- Book Table Availability
- Top Restaurants by Customer Votes
- Clean KPI Cards
- Dynamic Tableau Dashboard

---

## 🛠 Tech Stack

- Tableau Public
- MySQL
- SQL
- Python
- Pandas
- Jupyter Notebook
- GitHub

---

## 📁 Project Structure

```text
zomato-business-intelligence-dashboard
│
├── 📂 Dashboard
│   └── zomato_business_intelligence_dashboard.twbx
│      └── Interactive Tableau dashboard workbook
│
├── 📂 Dataset
│   ├── restaurant_summary.csv
│   │   └── Cleaned restaurant-level dataset
│   └── cuisine_split.csv
│       └── Cuisine-wise normalized dataset
│
├── 📂 Python
│   └── data_cleaning.ipynb
│       └── Data cleaning & preprocessing using Pandas
│
├── 📂 SQL
│   ├── restaurant_summary.sql
│   │   └── SQL queries for restaurant-level analysis
│   ├── cuisine_split.sql
│   │   └── SQL queries for cuisine analysis
│   └── business_queries.sql
│       └── Business insights and KPI queries
│
├── 📂 Screenshots
│   ├── dashboard_overview.png
│   ├── dashboard_filtered_location.png
│   ├── top_restaurant_types.png
│   ├── top_cuisines.png
│   └── customer_votes.png
│
├── 📄 README.md
│   └── Project documentation
│
└── 📄 LICENSE
    └── MIT License
```
---

## 🧹 Data Cleaning

Data preprocessing was performed in **Python (Pandas)**.

Cleaning included:

- Removing duplicate records
- Handling missing values
- Standardizing column names
- Splitting cuisines
- Preparing dashboard-ready datasets

---

## 🗄 SQL Analysis

SQL was used to perform business analysis including:

- Restaurant Type Distribution
- Cuisine Analysis
- Average Ratings
- Customer Votes
- Cost for Two
- Business Insights

---

## 📊 Dashboard Visualizations

### ⭐ Average Rating by Location

![Rating](Screenshots/dashboard_filtered_locations.png)

---

### 🍽 Top Restaurant Types

![Restaurant Types](Screenshots/top_restaurant_types.png)

---

### 🍜 Top Cuisines

![Cuisine](Screenshots/top_cuisines.png)

---

### 👍 Customer Votes

![Votes](Screenshots/customer_votes.png)

---

## 💡 Key Insights

- Lavelle Road has the highest average restaurant rating.
- Quick Bites dominate the restaurant market.
- North Indian cuisine is the most popular.
- Nearly half of restaurants support Online Ordering.
- Very few restaurants provide Table Booking.
- Onesta receives the highest customer votes.

---

## 🌐 Live Dashboard

🔗 Tableau Public Dashboard

https://public.tableau.com/app/profile/sumit.mallick6538/viz/zomato_business_intelligence_dashboard/ZomatoBusinessIntelligenceDashboard
---

## ⚙️ Installation & Usage

Clone the repository

```bash
git clone https://github.com/Sumit6342/zomato-business-intelligence-dashboard.git

Open

Tableau Workbook (.twbx)
SQL Scripts
Python Notebook

Explore the interactive dashboard.

👨‍💻 Author

Sumit Mallick

GitHub: https://github.com/Sumit6342
LinkedIn: (linkedin.com/in/sumit-mallick-ab96ab253/)
⭐ Support

If you found this project helpful, consider giving it a ⭐ on GitHub.
