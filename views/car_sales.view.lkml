view: car_sales {
  sql_table_name: `cars.car_sales` ;;

  dimension: co2_emissions {
    type: number
    sql: ${TABLE}.CO2_emissions ;;
  }
  dimension: car_sales_emissions_2022 {
    type: number
    sql:CASE
          WHEN ${fuel_type} <> "Electric" THEN
            ROUND(${co2_emissions} *
            (1 + 0.003 * (${displacement_cm3} / 1000)) *
            (1 - 0.00001 * (2022 - ${production_year}))+
            (0.02 * ${power_hp}))
          ELSE ROUND(${co2_emissions}+(0.02 * ${power_hp}))
        END ;;
  }
  dimension: car_sales_emissions_2023 {
    type: number
    sql:CASE
          WHEN ${fuel_type} <> "Electric" THEN
            ROUND(${co2_emissions} *
            (1 + 0.003 * (${displacement_cm3} / 1000)) *
            (1 - 0.00001 * (2023 - ${production_year}))+
            (0.035 * ${power_hp}))
          ELSE ROUND(${co2_emissions}+(0.035 * ${power_hp}))
        END ;;
  }
  dimension: car_sales_emissions_2024 {
    type: number
    sql:CASE
          WHEN ${fuel_type} <> "Electric" THEN
            ROUND(${co2_emissions} *
            (1 + 0.003 * (${displacement_cm3} / 1000)) *
            (1 - 0.00001 * (2024 - ${production_year}))+
            (0.065 * ${power_hp}))
          ELSE ROUND(${co2_emissions}+(0.065 * ${power_hp}))
        END ;;
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
            (1 - 0.001 * (${mileage_km} / 20000)) *
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
            (1 - 0.001 * (${mileage_km} / 10000)) *
            (1 + 0.0001 * (${power_hp} / 100)))
          ELSE ROUND(${price} * (1 - 0.0045 * (2024 - ${production_year})))
        END ;;
  }
  parameter: filtro {
    type: unquoted
    allowed_value: {
      label: "2021"
      value: "price"
    }
    allowed_value: {
      label: "2022"
      value: "car_sales_price_2022"
    }
    allowed_value: {
      label: "2023"
      value: "car_sales_price_2023"
    }
    allowed_value: {
      label: "2024"
      value: "car_sales_price_2024"
    }
  }
  dimension: dynamic {
    sql: {% if filtro._parameter_value == 'price' %}
          ${price}
        {% elsif filtro._parameter_value == 'car_sales_price_2022' %}
          ${car_sales_price_2022}
        {% elsif filtro._parameter_value == 'car_sales_price_2023' %}
          ${car_sales_price_2023}
        {% elsif filtro._parameter_value == 'car_sales_price_2024' %}
          ${car_sales_price_2024}
  {% endif %};;
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
  measure: avg_price {
    type: average
    sql: ${price};;
  }
  measure: avg_price_2022 {
    type: average
    sql: ${car_sales_price_2022};;
  }
  measure: avg_price_2023 {
    type: average
    sql: ${car_sales_price_2023} ;;
  }
  measure: avg_price_2024 {
    type: average
    sql: ${car_sales_price_2024}  ;;
  }
  measure: dynamic_price {
    type: number
    sql: CASE
          WHEN {% if filtro._parameter_value == 'price' %} TRUE {% else %} FALSE {% endif %} THEN ${avg_price}
          WHEN {% if filtro._parameter_value == 'car_sales_price_2022' %} TRUE {% else %} FALSE {% endif %} THEN ${avg_price_2022}
          WHEN {% if filtro._parameter_value == 'car_sales_price_2023' %} TRUE {% else %} FALSE {% endif %} THEN ${avg_price_2023}
          WHEN {% if filtro._parameter_value == 'car_sales_price_2024' %} TRUE {% else %} FALSE {% endif %} THEN ${avg_price_2024}
          else null
          END ;;
  }
  measure: avg_co2_emissions {
    type: average
    sql: ${co2_emissions};;
  }
  measure: avg_emissions_2022 {
    type: average
    sql: ${car_sales_emissions_2022};;
  }
  measure: avg_emissions_2023 {
    type: average
    sql: ${car_sales_emissions_2023} ;;
  }
  measure: avg_emissions_2024 {
    type: average
    sql: ${car_sales_emissions_2024}  ;;
  }
  measure: dynamic_emissions {
    type: number
    sql: CASE
          WHEN {% if filtro._parameter_value == 'price' %} TRUE {% else %} FALSE {% endif %} THEN ${avg_co2_emissions}
          WHEN {% if filtro._parameter_value == 'car_sales_price_2022' %} TRUE {% else %} FALSE {% endif %} THEN ${avg_emissions_2022}
          WHEN {% if filtro._parameter_value == 'car_sales_price_2023' %} TRUE {% else %} FALSE {% endif %} THEN ${avg_emissions_2023}
          WHEN {% if filtro._parameter_value == 'car_sales_price_2024' %} TRUE {% else %} FALSE {% endif %} THEN ${avg_emissions_2024}
          else null
          END ;;
  }
}
