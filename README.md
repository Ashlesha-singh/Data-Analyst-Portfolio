# IT Employee Attrition & Workforce Intelligence

## 📌 Project Overview

The **IT Employee Attrition & Workforce Intelligence** project analyzes employee attrition patterns using SQL, PostgreSQL, and Power BI.

The objective of this project is to understand employee attrition across different departments, job roles, overtime status, age groups, job satisfaction levels, years at the company, gender, and marital status.

The project combines **data cleaning, SQL analysis, DAX measures, and interactive Power BI visualization** to transform employee data into meaningful workforce insights.

---

## 🎯 Project Objectives

- Analyze overall employee attrition.
- Identify departments with higher numbers of employee attrition.
- Analyze attrition across different job roles.
- Examine the relationship between overtime and attrition counts.
- Analyze attrition across different age groups.
- Understand attrition patterns across job satisfaction levels.
- Analyze attrition based on years spent at the company.
- Compare attrition counts across gender and marital status.
- Build an interactive Power BI dashboard for workforce analysis.

---

## 🛠️ Tools & Technologies

- **PostgreSQL** – Data storage and SQL analysis
- **SQL** – Data querying and business analysis
- **Power BI** – Interactive dashboard and visualization
- **DAX** – Calculated measures and KPIs
- **Power Query** – Data preparation and transformation
- **GitHub** – Project documentation and version control

---

## 📊 Dataset

The project uses an employee attrition dataset containing employee demographic, job-related, satisfaction, income, and employment information.

The cleaned dataset used for analysis contains **1,000 employee records**.

### Key Columns Used

- Age
- Attrition
- Department
- JobRole
- MonthlyIncome
- JobSatisfaction
- YearsAtCompany
- OverTime
- Gender
- MaritalStatus

---

## 🧹 Data Preparation

The dataset was prepared before performing the analysis.

Major preparation steps included:

- Cleaning employee records.
- Handling data types appropriately.
- Preparing categorical and numerical fields.
- Creating age groups using Power BI bins.
- Creating years-at-company groups using Power BI bins.
- Importing the cleaned dataset into PostgreSQL and Power BI.
- Creating calculated measures using DAX.

---

## 🗄️ SQL Analysis

SQL was used to analyze employee attrition and workforce patterns.

The analysis included:

- Total employee count
- Attrition count
- Attrition by department
- Attrition by job role
- Attrition by overtime
- Attrition by age group
- Attrition by job satisfaction
- Attrition by years at company
- Attrition by gender
- Attrition by marital status

SQL analysis was performed using **PostgreSQL**.

---

## 📐 Power BI Measures

### Total Employees

```DAX
Total Employees =
COUNTROWS('employee_attrition_clean')

Attrition Count

Attrition Count =
CALCULATE(
    COUNTROWS('employee_attrition_clean'),
    'employee_attrition_clean'[Attrition] = 1
)

Attrition Rate

Attrition Rate =
DIVIDE(237, 1000)


Average Monthly Income

Average Monthly Income =
AVERAGE('employee_attrition_clean'[MonthlyIncome])

📈 Dashboard KPIs

The Power BI dashboard contains the following key performance indicators:

KPI	                Value
Total Employees	        1,000
Attrition Count	        237
Attrition Rate	        23.70%
Average Monthly Income	6.50K

📊 Dashboard Visualizations

The dashboard includes:

Attrition by Department
Attrition by Job Role
Attrition by OverTime
Attrition by Age Group
Attrition by Job Satisfaction
Attrition by Years at Company
Attrition by Gender
Attrition by Marital Status

## 🤖 Machine Learning Analysis

Machine Learning was also applied to the employee attrition dataset to explore the prediction of employee attrition.

### Model Used

- **Logistic Regression**

### Machine Learning Workflow

```text
Employee Attrition Dataset
        ↓
Data Exploration & Cleaning
        ↓
Categorical Encoding
        ↓
Train-Test Split
        ↓
Feature Scaling & Preprocessing
        ↓
Logistic Regression
        ↓
Predictions
        ↓
Model Evaluation




