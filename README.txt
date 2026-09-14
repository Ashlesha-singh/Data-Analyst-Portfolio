# E-Commerce Sales & Customer Intelligence (README)
## 📌 Project Overview

This project analyzes e-commerce sales and customer transaction data to identify revenue trends, customer purchasing behavior, payment preferences, product-category performance, and order outcomes.

The project combines **PostgreSQL, SQL, Power BI, Power Query, and DAX** to transform raw e-commerce data into an interactive business intelligence dashboard.

---

## 🎯 Business Objective

The main objectives of this project are to:

- Analyze overall e-commerce sales performance
- Identify the highest-revenue product categories
- Understand customer payment preferences
- Analyze order status and sales performance
- Evaluate customer review scores across product categories
- Identify revenue trends over time
- Build an interactive Power BI dashboard for business decision-making

---

## 📊 Dataset

The analysis is based on an e-commerce dataset containing information related to:

- Customers
- Orders
- Products
- Sellers
- Payments
- Reviews
- Product categories
- Customer locations

The dataset was cleaned and prepared before analysis.

---

## 🛠️ Tools & Technologies

- **PostgreSQL** – Data storage and SQL analysis
- **SQL** – Data exploration, aggregation, joins, filtering, ranking, and business analysis
- **Power Query** – Data cleaning and transformation
- **Power BI** – Interactive dashboard and data visualization
- **DAX** – Business measures and KPI calculations
- **GitHub** – Project documentation and portfolio management

---

## 🔎 SQL Analysis

SQL was used to answer key business questions, including:

- Which product categories generate the most revenue?
- Which categories receive the highest customer ratings?
- What payment methods are most frequently used?
- How does revenue vary by order status?
- How does revenue change over time?
- What are the overall order and sales metrics?

SQL techniques used include:

- `SELECT`
- `WHERE`
- `GROUP BY`
- `HAVING`
- `ORDER BY`
- `COUNT`
- `SUM`
- `AVG`
- `DISTINCT COUNT`
- `CASE`
- Subqueries
- Joins
- Ranking functions

---

## 📈 Power BI Dashboard

The Power BI dashboard provides an interactive view of e-commerce performance.

### Key KPIs

- **Total Revenue:** 20.53M
- **Total Orders:** ~99K
- **Average Order Value:** 172.83
- **Delivered Orders:** ~96K

### Dashboard Visuals

The dashboard includes:

- Revenue by Product Category
- Revenue Trend Over Time
- Orders by Payment Type
- Average Review Score by Product Category
- Sales by Order Status
- Orders by Product Category
- Order Status Filter
- Customer State Filter

---

## 🧮 DAX Measures

The following DAX measures were created for the dashboard:

### Total Revenue

```DAX
Total Revenue = SUM('public ecommerce_analysis'[payment_value])

###Total Orders
Total Orders = DISTINCTCOUNT('public ecommerce_analysis'[order_id])

###Average Order Value
Average Order Value = AVERAGE('public ecommerce_analysis'[payment_value])

###Delivered Orders
Delivered Orders = 
CALCULATE(
    DISTINCTCOUNT('public ecommerce_analysis'[order_id]),
    'public ecommerce_analysis'[order_status] = "delivered"
)


---

## 💡 Key Business Insights

### 1. Top Revenue Categories

The highest-revenue product categories are:

- `cama_mesa_banho`
- `beleza_saude`
- `informatica_acessorios`

These categories are major contributors to overall revenue.

### 2. Highest-Rated Categories

The categories with the highest average review scores include:

- `cds_dvds_musicais`
- `fashion_roupa_infanto_juvenil`
- `livros_interesse_geral`

This shows that the categories generating the most revenue are not necessarily the categories receiving the highest customer ratings.

### 3. Payment Preference

**Credit card** is the most commonly used payment method by order count, indicating a strong preference for card-based payments.

### 4. Order Status

**Delivered orders** account for the highest sales/revenue among the order statuses analyzed.

### 5. Revenue Trend

Revenue increased between **2016 and 2017** and remained relatively stable from **2017 to 2018**.

---

## 📌 Business Value

The analysis can help an e-commerce business:

- Identify high-performing product categories
- Understand customer payment behavior
- Monitor sales and order performance
- Identify categories with stronger customer satisfaction
- Track revenue trends
- Support data-driven business decisions

---

## 🚀 Skills Demonstrated

This project demonstrates practical experience in:

- Data cleaning
- Exploratory data analysis
- SQL-based business analysis
- PostgreSQL
- Data visualization
- Power BI dashboard development
- DAX measures
- Power Query
- KPI development
- Business insight generation
- Data storytelling

---

## 📁 Project Structure

```text
E-Commerce Sales & Customer Intelligence
│
├── E-Commerce_Sales_Customer_Intelligence.pbix
├── SQL
│   └── ecommerce_analysis.sql
└── README.md




## 👩‍💻 Project Author

**Ashlesha Singh**

Data Analytics Portfolio Project