
# Metric Definitions

## Revenue

Definition:
Total sale price from completed order items.

Grain:
Order item.

Source:
retail_bi.vw_fact_sales

Owner:
Commercial Analytics

---

## Orders

Definition:
Distinct count of completed order IDs.

---

## Units Sold

Definition:
Count of completed order items.

---

## Average Order Value

Definition:
Revenue divided by distinct completed orders.

Formula:

Revenue / Orders

---

## Gross Profit

Definition:
Revenue minus product cost.

Formula:

SUM(sale_price - unit_cost)

---

## Gross Margin %

Definition:
Gross profit divided by revenue.

Formula:

Gross Profit / Revenue
