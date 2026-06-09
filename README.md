# 🎯 RetailPulse — End-to-End Sales Forecasting System

![Python](https://img.shields.io/badge/Python-3.8+-blue?style=flat&logo=python)
![Power BI](https://img.shields.io/badge/Power%20BI-Dashboard-yellow?style=flat&logo=powerbi)
![PostgreSQL](https://img.shields.io/badge/PostgreSQL-Database-blue?style=flat&logo=postgresql)
![statsmodels](https://img.shields.io/badge/statsmodels-ARIMA-green?style=flat)
![License](https://img.shields.io/badge/License-MIT-lightgrey?style=flat)

> An end-to-end Time Series Analysis project that analyzes 4 years of retail sales data (2014–2017), forecasts next 3 months using ARIMA, and detects sales anomalies — all visualized in an interactive Power BI dashboard.

---

## 📌 Problem Statement

A US-based retail company sells Furniture, Technology, and Office Supplies across 4 regions. The business needed answers to:

- 📈 **How are sales trending** over time?
- 🔮 **What will next quarter's sales look like?**
- 🚨 **Were there any unusual months** that need investigation?

---

## 🗂️ Project Structure

```
retail-pulse-forecasting/
│
├── data/
│   ├── Sample - Superstore.csv        ← Raw dataset
│   ├── superstore_cleaned.csv         ← Cleaned dataset
│   ├── forecast.csv                   ← ARIMA forecast values
│   └── anomaly.csv                    ← Detected anomaly
│
├── notebooks/
│   ├── 01_EDA_and_Cleaning.ipynb
│   ├── 02_Time_Series_Decomposition.ipynb
│   ├── 03_Stationarity_and_ACF_PACF.ipynb
│   ├── 04_Forecasting_ARIMA.ipynb
│   └── 05_Anomaly_Detection.ipynb
│
├── sql/
│   ├── analysis.sql
│   └── data_loader.ipynb
│
├── dashboard/
│   └── retail_pulse.pbix
│
├── images/
│   └── dashboard.png
│
└── README.md
```

---

## 📓 Notebooks Summary

| # | Notebook | What I did |
|---|----------|-----------|
| 01 | EDA & Cleaning | Explored 9,994 rows, converted date formats, extracted time features |
| 02 | Decomposition | Split sales into Trend + Seasonality + Residual (Additive & Multiplicative) |
| 03 | Stationarity & ACF/PACF | ADF Test confirmed stationarity (p=0.0002), identified p=1, d=0, q=1 |
| 04 | ARIMA Forecasting | Trained ARIMA(1,0,1), forecasted Q1 2018, evaluated with MAE/RMSE/MAPE |
| 05 | Anomaly Detection | Flagged Nov 2017 as anomaly — 20% above statistical threshold |

---

## 🔍 Key Findings

```
📊 Dataset        → 9,994 orders | 4 years | 3 categories | 4 regions
📈 Sales Trend    → Grew 51% from 2014 ($484K) to 2017 ($733K)
🌍 Top Region     → West ($725K total sales)
🏆 Top Category   → Technology ($836K total sales)
🔮 Q1 2018 Forecast:
   → January  2018 = $70,398
   → February 2018 = $63,344
   → March    2018 = $58,498
   → Total Q1 2018 = $192,240
🚨 Anomaly → November 2017 ($118,448 — 20% above $98K threshold!)
   → Possible reason: Holiday Season + Black Friday
   → Recommendation: Replicate this strategy every year!
```

---

## 📊 ARIMA Model Summary

| Parameter | Value | Source |
|-----------|-------|--------|
| p | 1 | PACF Plot |
| d | 0 | ADF Test (already stationary) |
| q | 1 | ACF Plot |
| MAE | $25,761 | Model Evaluation |
| RMSE | $34,052 | Model Evaluation |
| MAPE | 32.18% | Model Evaluation |

> ⚠️ Note: ARIMA(1,0,1) captures overall trend but misses seasonal spikes. SARIMA recommended as future improvement.

---

## 🗄️ SQL Analysis

6 business queries written in PostgreSQL:

1. Monthly Sales Trend
2. Category-wise Revenue & Profit
3. Top 5 Sub-categories by Sales
4. Region-wise Performance
5. Year-over-Year Growth
6. Worst Performing Sub-categories

---

## 📱 Power BI Dashboard

![Dashboard](images/dashboard.png)

**Features:**
- 4 KPI Cards — Total Sales, Profit, Q1 Forecast, Anomaly Count
- Monthly Sales Trend + Red Anomaly Threshold Line ($98K)
- 3-Month Sales Forecast Chart (Jan–Mar 2018)
- Region-wise Performance Table
- Year-over-Year Sales Growth
- Interactive Slicers — Year & Category

---

## 🛠️ Tech Stack

| Tool | Usage |
|------|-------|
| Python | Data cleaning, analysis, modeling |
| Pandas & NumPy | Data manipulation |
| Matplotlib & Seaborn | Visualizations |
| statsmodels | ARIMA model |
| PostgreSQL | SQL analysis |
| Power BI | Interactive dashboard |

---

## ▶️ How to Run

```bash
# 1. Clone the repo
git clone https://github.com/aditya-datahub/retail-pulse-forecasting

# 2. Install dependencies
pip install pandas numpy matplotlib seaborn statsmodels scikit-learn

# 3. Run notebooks in order
# Start with 01_EDA_and_Cleaning.ipynb
```

---

## 📁 Dataset

**Source:** [Superstore Dataset — Kaggle](https://www.kaggle.com/datasets/vivek468/superstore-dataset-final)

| Feature | Details |
|---------|---------|
| Rows | 9,994 orders |
| Period | January 2014 — December 2017 |
| Columns | 21 features |
| Key fields | Order Date, Sales, Profit, Category, Region |

---

## 🔗 Connect

**Aditya Sharma**
[LinkedIn](https://www.linkedin.com/in/aditya-sharma-9b6588286/) | [GitHub](https://github.com/aditya-datahub)

---
*⭐ If you found this project useful, please star the repo!*
