connection: "bigquery_retail_bi"

include: "*.view.lkml"

access_grant: finance_access {
  user_attribute: department
  allowed_values: ["finance"]
}

explore: fact_sales {

  label: "Retail Sales"

  access_filter: {
    field: fact_sales.country
    user_attribute: allowed_country
  }

  join: products {

    type: left_outer

    sql_on:
      ${fact_sales.product_id} = ${products.id} ;;

    relationship: many_to_one

    fields: [
      id,
      product_name,
      cost
    ]
  }

  join: users {

    type: left_outer

    sql_on:
      ${fact_sales.user_id} = ${users.id} ;;

    relationship: many_to_one

    fields: [
      id,
      first_name,
      last_name,
      gender,
      country,
      state,
      traffic_source
    ]
  }

}