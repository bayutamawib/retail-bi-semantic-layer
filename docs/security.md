
# BI Security Design

## Row-Level Security

Regional users are restricted using:

user_attribute:
allowed_country

LookML:

access_filter:
  field: fact_sales.country
  user_attribute: allowed_country

## Field-Level Security

Sensitive financial fields such as:

- unit_cost
- gross_profit

are restricted through:

access_grant:
finance_access

## Principle

Security rules should be implemented centrally rather than replicated manually across dashboards.
