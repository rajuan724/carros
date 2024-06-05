
view: opt2024 {
  derived_table: {
    sql: WITH manager_vehicles AS (
          SELECT
              Index,
              price,
              co2_emissions,
              power_hp,
              vehicle_brand,
              vehicle_model,
              'Manager' AS user_type,
              ROW_NUMBER() OVER (PARTITION BY vehicle_brand ORDER BY co2_emissions) AS rn
          FROM `analitica-demos.cars.car_sales_`
          WHERE vehicle_brand IN ('BMW', 'Audi', 'Mercedes Benz') and year=2024
          ORDER BY co2_emissions
          LIMIT 40
      ),
      operator_vehicles AS (
          SELECT
              Index,
              price,
              co2_emissions,
              power_hp,
              vehicle_brand,
              vehicle_model,
              'Operator' AS user_type,
              ROW_NUMBER() OVER (PARTITION BY vehicle_brand ORDER BY co2_emissions) AS rn
          FROM `analitica-demos.cars.car_sales_`
          WHERE power_hp > 200
            AND Index NOT IN (SELECT Index FROM manager_vehicles) and year=2024
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
          vehicle_brand,
          vehicle_model,
          price,
          co2_emissions,
          power_hp,
          user_type,
          accumulated_price
      FROM accumulated_vehicles
      WHERE accumulated_price <= 10000000
      ORDER BY overall_rn ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }
  measure: money {
    type: max
    sql: ${accumulated_price} ;;
  }
  measure: total_co2 {
    type: sum
    sql: ${co2_emissions} ;;
  }
  dimension: index {
    primary_key: yes
    type: number
    sql: ${TABLE}.Index ;;
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

  set: detail {
    fields: [
        index,
  vehicle_brand,
  vehicle_model,
  price,
  co2_emissions,
  power_hp,
  user_type,
  accumulated_price
    ]
  }
}
