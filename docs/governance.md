
# BI Governance

## Naming Convention

snake_case for database fields.

Business-facing labels use readable names.

Examples:

order_id
order_date
gross_profit
gross_margin_pct

## Metric Governance

All executive KPIs must be defined in the semantic layer.

Dashboard-specific calculated fields should be minimized.

## Ownership

Revenue:
Commercial Analytics

Customer metrics:
Customer Analytics

Financial metrics:
Finance

Data model:
Data & BI Team

## Dashboard Standards

Every dashboard should document:

- Audience
- Business purpose
- Decision supported
- Data source
- Refresh cadence
- Metric definitions
- Owner

## Change Management

LookML changes should be version controlled through Git.

Production changes should go through review before deployment.

## Deprecation

Dashboards with low usage, duplicated metrics, or obsolete business logic should be reviewed for consolidation or decommissioning.
