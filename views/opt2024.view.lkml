
view: opt2024 {
  derived_table: {
    sql: WITH manager_vehicles AS (
          SELECT
              Index,
              Condition,
              Production_year,
              Fuel_type,
              Transmission,
              Doors_number,
              Colour,
              price,
              co2_emissions,
              power_hp,
              vehicle_brand,
              vehicle_model,
              'Manager' AS user_type,
              ROW_NUMBER() OVER (PARTITION BY vehicle_brand ORDER BY co2_emissions) AS rn
          FROM `analitica-demos.cars.car_sales_`
          WHERE vehicle_brand IN ('BMW', 'Audi', 'Mercedes-Benz') and year={% parameter years %}
          ORDER BY co2_emissions
          LIMIT 40
      ),
      operator_vehicles AS (
          SELECT
              Index,
              Condition,
              Production_year,
              Fuel_type,
              Transmission,
              Doors_number,
              Colour,
              price,
              co2_emissions,
              power_hp,
              vehicle_brand,
              vehicle_model,
              'Operator' AS user_type,
              ROW_NUMBER() OVER (PARTITION BY vehicle_brand ORDER BY co2_emissions) AS rn
          FROM `analitica-demos.cars.car_sales_`
          WHERE power_hp > {% parameter PH %} and vehicle_brand NOT IN ('BMW', 'Audi', 'Mercedes-Benz','Rolls-Royce','Lamborghini','Bentley','Ferrari','RAM','Alpine','Lotus','Porsche','Maserati','Cupra','Land Rover','GMC','Jaguar','DFSK')
            AND Index NOT IN (SELECT Index FROM manager_vehicles) and year= {% parameter years %}
          ORDER BY co2_emissions
          LIMIT 120
      ),
      combined_vehicles AS (
          SELECT * FROM manager_vehicles
          UNION ALL
          SELECT * FROM operator_vehicles
      ),
      ranked_vehicles AS (
          SELECT
              Index,
              Condition,
              Production_year,
              Fuel_type,
              Transmission,
              Doors_number,
              Colour,
              price,
              co2_emissions,
              power_hp,
              vehicle_brand,
              vehicle_model,
              user_type,
              ROW_NUMBER() OVER (ORDER BY co2_emissions) AS overall_rn
          FROM combined_vehicles
      ),
      accumulated_vehicles AS (
          SELECT
              *,
              SUM(price) OVER (ORDER BY overall_rn) AS accumulated_price
          FROM ranked_vehicles
      )
      SELECT
          Index,
          Condition,
          Production_year,
          Fuel_type,
          Transmission,
          Doors_number,
          Colour,
          vehicle_brand,
          vehicle_model,
          price,
          co2_emissions,
          power_hp,
          user_type,
          accumulated_price
      FROM accumulated_vehicles
      WHERE accumulated_price <= {% parameter max_price %}
      ORDER BY overall_rn ;;
  }
  parameter: max_price {
    type: number
    label: "Maximum Accumulated Price"
    default_value: "10000000"
  }
  parameter: years {
    type: number
    label: "año consulta"
    default_value: "2024"
  }
  parameter: PH {
    type: number
    label: "PH consulta"
    default_value: "150"
  }
  measure: count {
    type: count
    drill_fields: [detail*]
  }
  measure: money {
    type: max
    sql: ${accumulated_price} ;;
    value_format: "$#,##0"
  }
  measure: total_co2 {
    type: sum
    sql: ${co2_emissions} ;;
  }
  measure: average_co2 {
    type: average
    sql: ${co2_emissions} ;;
  }
  dimension: price_consulta{
    type: number
    sql: {% parameter max_price %} ;;
    value_format: "$#,##0"
  }
  dimension: index {
    primary_key: yes
    type: number
    sql: ${TABLE}.Index ;;
    value_format: "0"
  }

  dimension: vehicle_brand {
    type: string
    sql: ${TABLE}.vehicle_brand ;;
  }

  dimension: vehicle_model {
    type: string
    sql: ${TABLE}.vehicle_model ;;
  }

  dimension: price {
    type: number
    sql: ${TABLE}.price ;;
    value_format: "$#,##0"
  }

  dimension: co2_emissions {
    type: number
    sql: ${TABLE}.co2_emissions ;;
  }

  dimension: power_hp {
    type: number
    sql: ${TABLE}.power_hp ;;
  }

  dimension: user_type {
    type: string
    sql: ${TABLE}.user_type ;;
  }

  dimension: accumulated_price {
    type: number
    sql: ${TABLE}.accumulated_price ;;
  }
  dimension: condition {
    type: string
    sql: ${TABLE}.Condition ;;
  }
  dimension: production_year {
    type: number
    sql: ${TABLE}.Production_year ;;
    value_format: "0"
  }
  dimension: fuel_type {
    type: string
    sql: ${TABLE}.Fuel_type ;;
  }
  dimension: transmission {
    type: string
    sql: ${TABLE}.Transmission ;;
  }
  dimension: doors_number {
    type: number
    sql: ${TABLE}.Doors_number ;;
  }
  dimension: colour {
    type: string
    sql: ${TABLE}.Colour ;;
  }
  set: detail {
    fields: [
        index,
  vehicle_brand,
  vehicle_model,
  price,
  co2_emissions,
  power_hp,
  user_type
    ]
  }
}
