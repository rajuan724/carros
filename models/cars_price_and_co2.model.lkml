connection: "cars"

# include all the views
include: "/views/**/*.view.lkml"
include: "/**/*.dashboard"

datagroup: cars_price_and_co2_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: cars_price_and_co2_default_datagroup

explore: opt2024 {}
explore: opt2026 {}
explore: car_sales {
  join: opt2024 {
    type: left_outer
    relationship: one_to_one
    sql_on: ${car_sales.index} = ${opt2024.index};;
  }
}
