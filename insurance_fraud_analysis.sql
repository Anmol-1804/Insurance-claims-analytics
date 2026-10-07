-- Insurance Fraud Analytics
-- Source: Minitab Insurance Fraud dataset
-- SQL dialect: PostgreSQL-style

-- 1. Portfolio KPIs
SELECT
    COUNT(*) AS total_claims,
    ROUND(SUM(total_claim)::numeric,2) AS total_claim_value,
    ROUND(AVG(total_claim)::numeric,2) AS average_claim,
    ROUND(AVG("annual premium")::numeric,2) AS average_annual_premium,
    ROUND(100.0 * AVG(fraud_flag)::numeric,2) AS fraud_rate_pct
FROM insurance_fraud_clean
WHERE fraud_flag IS NOT NULL;

-- 2. Claim performance by channel
SELECT
    channel,
    COUNT(*) AS claims,
    ROUND(AVG(total_claim)::numeric,2) AS avg_claim,
    ROUND(AVG("days open")::numeric,2) AS avg_days_open,
    ROUND(100.0 * AVG(fraud_flag)::numeric,2) AS fraud_rate_pct
FROM insurance_fraud_clean
WHERE fraud_flag IS NOT NULL
GROUP BY channel
ORDER BY claims DESC;

-- 3. Accident-site performance
SELECT
    accident_site,
    COUNT(*) AS claims,
    ROUND(SUM(total_claim)::numeric,2) AS total_claim_value,
    ROUND(AVG(total_claim)::numeric,2) AS avg_claim,
    ROUND(100.0 * AVG(fraud_flag)::numeric,2) AS fraud_rate_pct
FROM insurance_fraud_clean
WHERE fraud_flag IS NOT NULL
GROUP BY accident_site
ORDER BY total_claim_value DESC;

-- 4. High-value claims: top decile
WITH ranked AS (
    SELECT *,
           NTILE(10) OVER (ORDER BY total_claim DESC) AS claim_decile
    FROM insurance_fraud_clean
    WHERE fraud_flag IS NOT NULL
)
SELECT claim_number, accident_site, channel, total_claim,
       fraud_reported, days_open
FROM ranked
WHERE claim_decile = 1
ORDER BY total_claim DESC;

-- 5. Monthly portfolio monitoring
SELECT
    claim_month,
    COUNT(*) AS claims,
    ROUND(SUM(total_claim)::numeric,2) AS total_claim_value,
    ROUND(AVG(total_claim)::numeric,2) AS avg_claim,
    ROUND(100.0 * AVG(fraud_flag)::numeric,2) AS fraud_rate_pct
FROM insurance_fraud_clean
WHERE fraud_flag IS NOT NULL
GROUP BY claim_month
ORDER BY claim_month;

-- 6. Claims-processing efficiency
SELECT
    channel,
    ROUND(AVG("days open")::numeric,2) AS avg_days_open,
    ROUND(AVG("form defects")::numeric,2) AS avg_form_defects,
    COUNT(*) AS claims
FROM insurance_fraud_clean
GROUP BY channel
ORDER BY avg_days_open DESC;
