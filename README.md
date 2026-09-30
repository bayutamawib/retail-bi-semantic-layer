
# Retail BI Semantic Layer & Governance Framework

## Overview

This project demonstrates an end-to-end Business Intelligence architecture for a retail/e-commerce environment using BigQuery, SQL, LookML-style semantic modeling, and Google Data Studio.

The project focuses on more than dashboard development. It demonstrates centralized metric definitions, dimensional modeling, data quality validation, BI governance, security concepts, and self-service analytics design.

## Business Problem

Retail analytics teams often face inconsistent KPI definitions, duplicated business logic across dashboards, unclear ownership of metrics, and limited governance around data access.

This project addresses these challenges by designing a governed semantic layer between the data warehouse and business-facing reporting.

## Architecture

```text
TheLook eCommerce Public Dataset
                |
                v
           BigQuery
                |
                v
        SQL Data Marts / Views
                |
                v
      LookML Semantic Model
                |
        +-------+--------+
        |                |
     Explores        Governance
        |                |
        +-------+--------+
                |
                v
       Business Reporting
                |
                v
       Google Data Studio
```

## Technology Stack

* Google BigQuery
* SQL
* LookML
* Google Data Studio
* Git / GitHub

## Data Model

The primary analytical fact is modeled at:

> One row per order item

Core entities include:

* Sales / order items
* Products
* Customers / users
* Countries and regions

## Semantic Layer

The proposed LookML semantic model defines:

### Dimensions

* Country
* State
* Category
* Department
* Brand
* Product
* Order Date

### Measures

* Revenue
* Orders
* Units Sold
* Gross Profit
* Gross Margin %
* Average Order Value

Business metrics are centralized in the semantic layer rather than independently recreated across dashboards.

## Security Design

The LookML design includes:

### Row-level security

User attributes and access filters can restrict users to permitted countries or regions.

### Field-level access

Sensitive financial fields such as unit cost can be protected using access grants.

## Governance

Metric definitions include:

* Business definition
* Calculation logic
* Source
* Grain
* Ownership

Changes to the semantic model should be version-controlled and reviewed before deployment.

## Dashboard

The executive dashboard contains:

* Revenue
* Orders
* Average Order Value
* Gross Profit
* Monthly Revenue Trend
* Revenue by Country
* Revenue by Category
* Top Products

## Data Quality

Basic validation checks cover:

* Primary key uniqueness
* Missing values
* Product/customer references
* Profitability anomalies

## LookML Design

Example LookML artifacts are included in `/lookml`.

The project demonstrates:

* Views
* Dimensions
* Measures
* Explores
* Joins
* Join relationships
* Access filters
* Access grants

## Important Note

The LookML artifacts in this repository represent a portfolio implementation and architecture exercise. They are not presented as a production Looker deployment.

## Future Improvements

* dbt transformation layer
* Production Looker deployment
* CI/CD for LookML
* Automated data quality testing
* Dashboard usage monitoring
* More granular row-level access control
