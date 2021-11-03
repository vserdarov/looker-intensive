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
      month,
      quarter,
      year
    ]
    sql: ${TABLE}."CREATED_AT" ;;
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
    sql: ${returned_date} IS NOT NULL;;
    group_label: "Shipping"
  }

  dimension: sale_price {
    type: number
    sql: ${TABLE}."SALE_PRICE" ;;
  }

  measure: total_sales_price {
    type: sum
    description: "Total sales from items sold"
    sql: ${sale_price} ;;
    value_format_name: usd
  }

  measure: average_sales_price {
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
    type: number
    description: "Total revenue from completed sales (cancelled and returned orders excluded)"
    sql: ${total_sales_price}
    filters: [status: "complete"];;
    value_format_name: usd
  }

  measure: total_gross_margin_amount {
    type: number
    description: "Total difference between the total revenue from completed sales and the cost of the goods that were sold"
    sql: ${order_items.total_sales_price} - ${inventory_items.total_cost} ;;
    value_format_name: usd
  }

  measure: average_gross_margin_amount {
    type: average
    description: "Average difference between the total revenue from completed sales and the cost of the goods that were sold"
    sql: ${order_items.sale_price} - ${inventory_items.cost} ;;
    value_format_name: usd
  }

  measure: gross_margin {
    type: number
    description: "Total Gross Margin Amount / Total Gross Revenue"
    sql: ${total_gross_margin_amount} / ${inventory_items.total_cost} ;;
    value_format_name: percent_1
  }

  measure: items_returned {
    type: count_distinct
    description: "Number of items that were returned by dissatisfied customers"
     sql: ${inventory_item_id})
    filters: [status: "Returned"];;
  }

  measure: items_sold {
    type: count_distinct
    description: "Number of items sold"
    sql: ${inventory_item_id}
      filters: [status: "Complete"];;
  }

  measure: items_return_rate {
    type: number
    description: "Number of Items Returned / total number of items sold"
    sql: ${items_returned} / ${items_sold};;
    value_format_name: percent_1
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
