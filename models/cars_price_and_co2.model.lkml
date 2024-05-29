connection: "cars"

# include all the views
include: "/views/**/*.view.lkml"

datagroup: cars_price_and_co2_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: cars_price_and_co2_default_datagroup

explore: car_sales {}

