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
  dimension: car_sales_price_2022 {
    type: number
    sql:CASE
          WHEN ${condition} = "Used" THEN
            ROUND(${price} *
            (1 - 0.005 * (2022 - ${production_year})) *
            (1 - 0.001 * (${mileage_km} / 25000)) *
            (1 + 0.0001 * (${power_hp} / 100)))
          ELSE ROUND(${price} * (1 - 0.004 * (2022 - ${production_year})))
        END ;;
  }
  dimension: car_sales_price_2023 {
    type: number
    sql:CASE
          WHEN ${condition} = "Used" THEN
            ROUND(${price} *
            (1 - 0.005 * (2023 - ${production_year})) *
            (1 - 0.001 * (${mileage_km} / 25000)) *
            (1 + 0.0001 * (${power_hp} / 100)))
          ELSE ROUND(${price} * (1 - 0.004 * (2023 - ${production_year})))
        END ;;
  }
  dimension: car_sales_price_2024 {
    type: number
    sql:CASE
          WHEN ${condition} = "Used" THEN
            ROUND(${price} *
            (1 - 0.005 * (2024 - ${production_year})) *
            (1 - 0.001 * (${mileage_km} / 20000)) *
            (1 + 0.0001 * (${power_hp} / 100)))
          ELSE ROUND(${price} * (1 - 0.0045 * (2024 - ${production_year})))
        END ;;
  }
  parameter: filtro {
    type: unquoted
    allowed_value: {
      label: "car_salprice"
      value: "price"
    }
    allowed_value: {
      label: "1 Año"
      value: "car_sales_price_2022"
    }
    allowed_value: {
      label: "2 Año"
      value: "car_sales_price_2023"
    }
    allowed_value: {
      label: "3 Año"
      value: "car_sales_price_2024"
    }
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
  measure: avg_prices {
    type: average
    sql: ${TABLE}.{% parameter filtro %};;
  }
  measure: avg_price {
    type: average
    sql: ${price};;
  }
  measure: avg_price_2022 {
    type: average
    sql: ${car_sales_price_2022} ;;
  }
  measure: avg_price_2023 {
    type: average
    sql: ${car_sales_price_2023} ;;
  }
  measure: avg_price_2024 {
    type: average
    sql: ${car_sales_price_2024}  ;;
  }
  measure: avg_co2_emissions {
    type: average
    sql: ${co2_emissions};;
  }
}
