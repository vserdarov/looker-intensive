view: users {
  sql_table_name: "PUBLIC"."USERS"
    ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}."ID" ;;
  }

  dimension: age {
    type: number
    sql: ${TABLE}."AGE" ;;
  }

  dimension: age_tier {
    type: bin
    bins: [0, 18, 25, 35, 45, 55, 65, 75, 90]
    style: integer
    sql: ${age} ;;
  }

  dimension: new_customers {
    type: yesno
    sql: datediff(day,${created_raw},current_date())<91;;
  }

  dimension: new_or_returning_customers {

    type: string
    sql: CASE WHEN ${new_customers} THEN 'New' ELSE 'Returning' END;;
  }

  dimension: city {
    type: string
    sql: ${TABLE}."CITY" ;;
  }

  dimension: city_state {
    type: string
    description: "City + State"
    sql: ${city} || ' ' || ${state} ;;
    group_label: "Geography"
  }

  dimension: country {
    type: string
    sql: ${TABLE}."COUNTRY" ;;
    map_layer_name: countries
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

  dimension: email {
    type: string
    sql: ${TABLE}."EMAIL" ;;
  }

  dimension: first_name {
    type: string
    sql: ${TABLE}."FIRST_NAME" ;;
  }

  dimension: gender {
    type: string
    sql: ${TABLE}."GENDER" ;;
  }

  dimension: last_name {
    type: string
    sql: ${TABLE}."LAST_NAME" ;;
  }

  dimension: latitude {
    type: number
    sql: ${TABLE}."LATITUDE" ;;
  }

  dimension: longitude {
    type: number
    sql: ${TABLE}."LONGITUDE" ;;
  }

  dimension: state {
    type: string
    sql: ${TABLE}."STATE" ;;
    map_layer_name: us_states
  }

  dimension: traffic_source {
    type: string
    sql: ${TABLE}."TRAFFIC_SOURCE" ;;
  }

  dimension: zip {
    type: zipcode
    sql: ${TABLE}."ZIP" ;;
  }

  measure: count {
    type: count
    drill_fields: [id, last_name, first_name, events.count, order_items.count]
  }
}
