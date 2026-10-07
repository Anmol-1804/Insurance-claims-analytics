# Insurance Claims Analytics & Fraud Monitoring

## Recruiter-ready analytics project

An end-to-end insurance analytics project built on the **Minitab Insurance Fraud dataset**. The workflow combines Python, SQL, statistical analysis, predictive modelling and automated MIS reporting to demonstrate how claims data can be converted into business monitoring insights.

**Dataset:** 12,002 raw claim records; 11,994 records with known fraud outcomes.  
**Fraud reported rate among known outcomes:** 24.6%.

Minitab documents this dataset as an automotive-insurance fraud-detection scenario and provides the field definitions used in this project. citeturn0search0turn0search1

## What this project demonstrates

- **Large-scale data analysis:** claim volume, severity, channel, accident-site and operational patterns
- **Statistical analytics:** distributions, correlation structure and fraud-rate segmentation
- **Predictive analytics:** Logistic Regression baseline for fraud-risk scoring
- **SQL analytics:** KPIs, segmentation, window functions and monitoring queries
- **MIS automation:** Excel-based management reporting generated from Python
- **Business communication:** decision-oriented charts and portfolio monitoring views

## Visual analytics showcase

### Executive portfolio view
![Executive overview](visualizations/00_executive_portfolio_overview.png)

### Fraud exposure by channel
![Channel exposure](visualizations/01_fraud_exposure_by_channel.png)

### Claim severity and fraud
![Severity](visualizations/03_fraud_rate_by_claim_severity.png)

### Accident site × channel
![Heatmap](visualizations/04_accident_site_channel_heatmap.png)

### Monthly monitoring
![Monthly monitoring](visualizations/05_monthly_volume_and_fraud_rate.png)

### Predictive model evaluation
![Model evaluation](visualizations/08_model_roc_and_precision_recall.png)

## Analytical workflow

1. **Data quality & preparation**
   - Parsed claim dates
   - Standardised numeric fields
   - Converted fraud outcome into a binary analytical target
   - Created claim-month and severity-band features
2. **Portfolio analytics**
   - Claim volumes and claim-value distributions
   - Channel and accident-site segmentation
   - Vehicle-category analysis
   - Monthly monitoring
3. **Fraud analytics**
   - Fraud-rate segmentation
   - Severity-band analysis
   - Accident-site × channel heatmap
4. **Predictive modelling**
   - Stratified train/test split
   - Median imputation + standardisation for numeric features
   - One-hot encoding for categorical features
   - Class-weighted Logistic Regression
   - ROC-AUC and precision–recall evaluation
5. **Reporting & automation**
   - SQL KPI layer
   - Automated Excel MIS workbook
   - Reusable Python scripts

## Repository structure

```text
insurance-claims-analytics/
├── README.md
├── Insurance_Fraud_Analytics.ipynb
├── insurance_fraud_data.csv
├── insurance_fraud_clean.csv
├── insurance_fraud_analysis.sql
├── fraud_model.py
├── generate_mis.py
├── Insurance_Fraud_MIS.xlsx
├── data_dictionary.csv
├── requirements.txt
└── visualizations/
    ├── 00_executive_portfolio_overview.png
    ├── 01_fraud_exposure_by_channel.png
    ├── 02_claim_amount_distribution_by_fraud.png
    ├── 03_fraud_rate_by_claim_severity.png
    ├── 04_accident_site_channel_heatmap.png
    ├── 05_monthly_volume_and_fraud_rate.png
    ├── 06_processing_duration_by_fraud.png
    ├── 07_numeric_driver_correlation_matrix.png
    ├── 08_model_roc_and_precision_recall.png
    ├── 09_predicted_risk_score_distribution.png
    └── 10_claim_value_pareto.png
```

## Important interpretation note

The Logistic Regression model is intentionally positioned as a **baseline fraud-risk model**, not as a production fraud engine. The objective is to demonstrate the complete analytical workflow: data preparation → segmentation → statistical analysis → predictive modelling → reporting.

## Source

Official Minitab Insurance Fraud dataset documentation:  
https://support.minitab.com/en-us/minitab-solution-center/getting-started-tutorials/dataset-description/

## Disclaimer

This is an academic / portfolio analytics project using a public dataset. It is not intended for real-world underwriting, claims adjudication or fraud-decision deployment without further validation, governance and domain review.
