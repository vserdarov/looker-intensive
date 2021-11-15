view: order_items {
  sql_table_name: "PUBLIC"."ORDER_ITEMS"
    ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}."ID" ;;
  }

  dimension_group: created {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      week_of_year,
      month,
      month_name,
      quarter,
      year
    ]
    sql: ${TABLE}."CREATED_AT" ;;
  }

  dimension: current_vs_previous {
    description: "current vs previous period comparison"
    type: string
    sql:
    CASE
      WHEN DATE_TRUNC({% parameter parameters.select_timeframe %}, ${created_raw}) = DATE_TRUNC({% parameter parameters.select_timeframe %}, {% if parameters.select_reference_date._is_filtered %}{% parameter parameters.select_reference_date %} {% else %} ${parameters.current_timestamp_raw}{% endif %})
        THEN '{% if parameters.select_reference_date._is_filtered %}Reference {% else %}Current {% endif %} {% parameter parameters.select_timeframe %}'
      WHEN DATE_TRUNC({% parameter parameters.select_timeframe %}, ${created_raw}) = DATE_TRUNC({% parameter parameters.select_timeframe %}, DATEADD({% parameter parameters.select_timeframe %}, -1, {% if parameters.select_reference_date._is_filtered %}{% parameter parameters.select_reference_date %} {% else %} ${parameters.current_timestamp_raw}{% endif %}))
        THEN 'Previous {% parameter parameters.select_timeframe %}'
      ELSE NULL
    END
  ;;
  }

  dimension_group: delivered {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}."DELIVERED_AT" ;;
  }

  dimension: shipping_days {
    type: number
    description: "# of days between the order ship date and the order delivered date "
    sql: DATEDIFF( day, ${shipped_date}, ${delivered_date}) ;;
    group_label: "Shipping"
  }

  dimension: inventory_item_id {
    type: number
    # hidden: yes
    sql: ${TABLE}."INVENTORY_ITEM_ID" ;;
  }

  dimension: order_id {
    type: number
    sql: ${TABLE}."ORDER_ID" ;;
  }

  dimension_group: returned {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}."RETURNED_AT" ;;

  }

  dimension: is_returned {
    type: yesno
    description: "Calculates whether the order was returned or not"
    sql: ${status} = "Returned";;
  }

  dimension: is_cancelled_or_returned{
    type: yesno
    description: "Shows whether the order was returned or cancelled"
    sql: ${status} = 'Returned' or ${status} = 'Cancelled'  ;;
  }

  dimension: sale_price {
    type: number
    sql: ${TABLE}."SALE_PRICE" ;;
  }

  measure: total_sale_price {
    type: sum
    description: "Total sales from items sold"
    sql: ${sale_price} ;;
    value_format_name: usd
  }

  measure: average_sale_price {
    type: average
    description: "Average sale price of items sold"
    sql: ${sale_price} ;;
    value_format_name: usd
  }

  measure: cumulative_total_sales {
    type: running_total
    description: "Cumulative total sales from items sold (also known as a running total)"
    sql: ${sale_price} ;;
    value_format_name: usd
  }

  measure: total_gross_revenue {
    type: sum
    description: "Total revenue from completed sales (cancelled and returned orders excluded)"
    sql: ${sale_price};;
    filters: [is_cancelled_or_returned: "No"]
    value_format_name: usd
    drill_fields: [detail*]
  }

  measure: total_cost_items_sold {
    type: sum
    description: "Total cost of items sold from inventory"
    sql: ${inventory_items.cost} ;;
    filters: [is_cancelled_or_returned: "No"]
  }

  measure: average_cost_items_sold {
    type: average
    description: "Total cost of items sold from inventory"
    sql: ${inventory_items.cost} ;;
    filters: [is_cancelled_or_returned: "No"]
  }

  dimension: margin {
    description: "Sales - Cost"
    type: number
    hidden: yes
    sql: ${sale_price} - ${inventory_items.cost} ;;
    value_format_name: usd
  }

  measure: total_gross_margin_amount {
    type: sum
    description: "Total difference between the total revenue from completed sales and the cost of the goods that were sold"
    sql: ${margin};;
    filters: [is_cancelled_or_returned: "No"]
    value_format_name: usd
  }

  measure: average_gross_margin_amount {
    type: average
    description: "Average difference between the total revenue from completed sales and the cost of the goods that were sold"
    sql: ${margin};;
    filters: [is_cancelled_or_returned: "No"]
    value_format_name: usd
  }

  measure: gross_margin_percentage {
    type: number
    description: "Total Gross Margin Amount / Total Gross Revenue"
    sql: 1.0 * ${total_gross_margin_amount} / nullif(${total_gross_revenue},0);;
    value_format_name: percent_1
  }

  measure: items_returned {
    type: count_distinct
    description: "Number of items that were returned by dissatisfied customers"
     sql: ${inventory_item_id})
    filters: [is_returned: "Yes"];;
  }

  measure: items_sold {
    type: count_distinct
    description: "Number of items sold"
    sql: ${inventory_item_id}
      filters: [is_cancelled_or_returned: "No"];;
  }

  measure: items_return_rate {
    type: number
    description: "Number of Items Returned / total number of items sold"
    sql: 1.0 * ${items_returned} / ifnull(${items_sold}, 0);;
    value_format_name: percent_1
  }

  measure: total_number_of_customers {
    type: count_distinct
    description: "Total number of customers"
    sql:${user_id};;
  }

  measure: customers_with_returned_items {
    type: count_distinct
    description: "Number of users who have returned an item at some point"
    sql: ${user_id}
      filters: [is_returned: "Yes"];;
  }

  measure: users_with_returns_percentage {
    type: number
    description: "Number of Customer Returning Items / total number of customers"
    sql: 1.0 * ${customers_with_returned_items} / nullif(${total_number_of_customers},0);;
    value_format_name: percent_1
  }

  measure: average_customer_spend_percentage {
    type: number
    description: "Total Sale Price / total number of customers"
    sql: 1.0 * ${total_sale_price} / nullif(${total_number_of_customers}, 0);;
    value_format_name: percent_1
  }

  measure: average_customer_spend {
    description: "Total Sale Price / total number of customers"
    type: number
    sql:  ${total_sale_price} / nullif(${total_number_of_customers},0) ;;
    value_format_name: usd
  }

  dimension_group: shipped {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}."SHIPPED_AT" ;;
  }

  dimension: status {
    type: string
    sql: ${TABLE}."STATUS" ;;
  }

  dimension: user_id {
    type: number
    # hidden: yes
    sql: ${TABLE}."USER_ID" ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      id,
      inventory_items.product_name,
      inventory_items.id,
      users.last_name,
      users.id,
      users.first_name
    ]
  }
}
