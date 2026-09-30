view: fact_sales {

  sql_table_name:
    `YOUR_PROJECT_ID.retail_bi.vw_fact_sales` ;;

  # -------------------------
  # IDENTIFIERS
  # -------------------------

  dimension: order_item_id {
    primary_key: yes
    type: number
    sql: ${TABLE}.order_item_id ;;
  }

  dimension: order_id {
    type: number
    sql: ${TABLE}.order_id ;;
  }

  dimension: user_id {
    type: number
    sql: ${TABLE}.user_id ;;
  }

  dimension: product_id {
    type: number
    sql: ${TABLE}.product_id ;;
  }

  # -------------------------
  # TIME
  # -------------------------

  dimension_group: order_date {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.order_date ;;
  }

  # -------------------------
  # BUSINESS DIMENSIONS
  # -------------------------

  dimension: country {
    type: string
    sql: ${TABLE}.country ;;
  }

  dimension: state {
    type: string
    sql: ${TABLE}.state ;;
  }

  dimension: gender {
    type: string
    sql: ${TABLE}.gender ;;
  }

  dimension: traffic_source {
    type: string
    sql: ${TABLE}.traffic_source ;;
  }

  dimension: category {
    type: string
    sql: ${TABLE}.category ;;
  }

  dimension: department {
    type: string
    sql: ${TABLE}.department ;;
  }

  dimension: brand {
    type: string
    sql: ${TABLE}.brand ;;
  }

  dimension: product_name {
    type: string
    sql: ${TABLE}.product_name ;;
  }

  # -------------------------
  # FINANCIAL FIELDS
  # -------------------------

  dimension: unit_cost {
    type: number
    sql: ${TABLE}.unit_cost ;;

  required_access_grants: [finance_access]
  }

  dimension: sale_price {
    type: number
    sql: ${TABLE}.sale_price ;;
  }

  dimension: gross_profit_value {
    type: number
    sql: ${TABLE}.gross_profit ;;
  }

  # -------------------------
  # MEASURES
  # -------------------------

  measure: revenue {
    label: "Revenue"
    description: "Total sales value from completed order items."
    type: sum
    sql: ${sale_price} ;;
  }

  measure: orders {
    label: "Orders"
    description: "Distinct count of completed orders."
    type: count_distinct
    sql: ${order_id} ;;
  }

  measure: units_sold {
    label: "Units Sold"
    description: "Number of completed order items."
    type: count
    sql: ${order_item_id} ;;
  }

  measure: gross_profit {
    label: "Gross Profit"
    description: "Revenue minus product cost."
    type: sum
    sql: ${gross_profit_value} ;;
  }

  measure: gross_margin_pct {
    label: "Gross Margin %"
    description: "Gross profit divided by revenue."
    type: number
    sql:
      SAFE_DIVIDE(
        ${gross_profit},
        ${revenue}
      ) ;;
    value_format_name: "percent_2"
  }

  measure: average_order_value {
    label: "Average Order Value"
    description: "Revenue divided by distinct order count."
    type: number
    sql:
      SAFE_DIVIDE(
        ${revenue},
        ${orders}
      ) ;;
  }
}