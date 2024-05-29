view: car_sales {
  sql_table_name: `cars.car_sales` ;;

  dimension: co2_emissions {
    type: number
    sql: ${TABLE}.CO2_emissions ;;
  }
  dimension: colour {
    type: string
    sql: ${TABLE}.Colour ;;
  }
  dimension: condition {
    type: string
    sql: ${TABLE}.Condition ;;
  }
  dimension: currency {
    type: string
    sql: ${TABLE}.Currency ;;
  }
  dimension: displacement_cm3 {
    type: number
    sql: ${TABLE}.Displacement_cm3 ;;
  }
  dimension: doors_number {
    type: number
    sql: ${TABLE}.Doors_number ;;
  }
  dimension: fuel_type {
    type: string
    sql: ${TABLE}.Fuel_type ;;
  }
  dimension: index {
    type: number
    sql: ${TABLE}.Index ;;
  }
  dimension: mileage_km {
    type: number
    sql: ${TABLE}.Mileage_km ;;
  }
  dimension_group: offer_publication {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.Offer_publication_date ;;
  }
  dimension: power_hp {
    type: number
    sql: ${TABLE}.Power_HP ;;
  }
  dimension: price {
    type: number
    sql: ${TABLE}.Price ;;
  }
  dimension: production_year {
    type: number
    sql: ${TABLE}.Production_year ;;
  }
  dimension: transmission {
    type: string
    sql: ${TABLE}.Transmission ;;
  }
  dimension: type {
    type: string
    sql: ${TABLE}.Type ;;
  }
  dimension: vehicle_brand {
    type: string
    sql: ${TABLE}.Vehicle_brand ;;
  }
  dimension: vehicle_model {
    type: string
    sql: ${TABLE}.Vehicle_model ;;
  }
  measure: count {
    type: count
  }
}
