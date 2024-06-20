---
- dashboard: valiat
  title: Demo Valiat
  layout: newspaper
  preferred_viewer: dashboards-next
  description: ''
  preferred_slug: umckAinaC9KodR3jOWU6XU
  elements:
  - title: Gasto previsto
    name: Gasto previsto
    model: cars_price_and_co2
    explore: opt2024
    type: single_value
    fields: [opt2024.money]
    filters: {}
    limit: 500
    column_limit: 50
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    defaults_version: 1
    listen:
      PH consulta: opt2024.PH
      Año consulta: opt2024.years
      Precio consulta: opt2024.max_price
    row: 4
    col: 0
    width: 7
    height: 2
  - title: Resultados por transmisión
    name: Resultados por transmisión
    model: cars_price_and_co2
    explore: opt2024
    type: looker_donut_multiples
    fields: [opt2024.transmission, opt2024.condition, opt2024.count]
    pivots: [opt2024.transmission]
    filters: {}
    sorts: [opt2024.transmission, opt2024.count desc 0]
    limit: 500
    column_limit: 50
    show_value_labels: true
    font_size: 16
    color_application:
      collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2
      palette_id: e34425a5-3228-4f76-b45d-2e7cd13a6766
      options:
        steps: 5
        reverse: false
    series_colors:
      Automatic - opt2024.count: "#7e5c5f"
      Manual - opt2024.count: "#cb5761"
    hidden_pivots: {}
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    listen:
      Precio consulta: opt2024.max_price
      Año consulta: opt2024.years
      PH consulta: opt2024.PH
    row: 7
    col: 0
    width: 7
    height: 5
  - title: 'Asignación empleados por color de carro '
    name: 'Asignación empleados por color de carro '
    model: cars_price_and_co2
    explore: opt2024
    type: looker_column
    fields: [opt2024.colour, opt2024.count, opt2024.user_type]
    pivots: [opt2024.colour]
    sorts: [opt2024.colour, opt2024.user_type, opt2024.count desc 0]
    limit: 500
    column_limit: 50
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: normal
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: true
    show_silhouette: false
    totals_color: "#808080"
    color_application:
      collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2
      palette_id: c65a64ce-7f46-476b-a320-41345941e5b1
      options:
        steps: 5
        reverse: false
    y_axes: [{label: count, orientation: left, series: [{axisId: black - opt2024.count,
            id: black - opt2024.count, name: black}, {axisId: blue - opt2024.count,
            id: blue - opt2024.count, name: blue}, {axisId: gray - opt2024.count,
            id: gray - opt2024.count, name: gray}, {axisId: red - opt2024.count, id: red
              - opt2024.count, name: red}, {axisId: silver - opt2024.count, id: silver
              - opt2024.count, name: silver}, {axisId: white - opt2024.count, id: white
              - opt2024.count, name: white}], showLabels: true, showValues: true,
        unpinAxis: false, tickDensity: default, tickDensityCustom: 5, type: linear}]
    x_axis_label: ''
    x_axis_zoom: true
    y_axis_zoom: true
    font_size: '12'
    series_colors:
      opt2024.count: "#E8710A"
      black - opt2024.count: "#000000"
      blue - opt2024.count: "#1A73E8"
      gray - opt2024.count: "#7d767d"
      red - opt2024.count: "#EA4335"
      silver - opt2024.count: "#c4c9c9"
      white - opt2024.count: "#fffee8"
    series_labels:
      opt2024.count: black
    advanced_vis_config: |-
      {
        chart: {},
        series: [{
          name: 'black'
          color: '#000000'
        }, {
          name: 'blue'
          color: '#1A73E8'
        }, {
          name: 'gray'
          color: '#7d767d'
        }, {
          name: 'red'
          color: '#EA4335'
        }, {
          name: 'silver'
          color: '#c4c9c9'
        }, {
          name: 'white'
          color: '#fffee8'
        }]
      }
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    show_row_numbers: true
    transpose: false
    truncate_text: true
    truncate_header: false
    size_to_fit: true
    minimum_column_width: 75
    series_cell_visualizations:
      opt2024.count:
        is_active: true
    table_theme: unstyled
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting: [{type: along a scale..., value: !!null '', background_color: !!null '',
        font_color: !!null '', color_application: {collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2,
          palette_id: 4a00499b-c0fe-4b15-a304-4083c07ff4c4}, bold: false, italic: false,
        strikethrough: false, fields: []}]
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    defaults_version: 1
    hide_totals: false
    hide_row_totals: false
    hidden_pivots: {}
    listen:
      Precio consulta: opt2024.max_price
      Año consulta: opt2024.years
      PH consulta: opt2024.PH
    row: 7
    col: 7
    width: 9
    height: 5
  - title: Clasificación tipo combustible
    name: Clasificación tipo combustible
    model: cars_price_and_co2
    explore: opt2024
    type: looker_bar
    fields: [opt2024.fuel_type, opt2024.count]
    sorts: [opt2024.count desc 0]
    limit: 500
    column_limit: 50
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: true
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    y_axes: [{label: count, orientation: bottom, series: [{axisId: opt2024.count,
            id: opt2024.count, name: Opt2024}], showLabels: true, showValues: true,
        unpinAxis: false, tickDensity: default, tickDensityCustom: 5, type: linear}]
    x_axis_label: ''
    x_axis_zoom: true
    y_axis_zoom: true
    series_colors:
      opt2024.count: "#cb5761"
    defaults_version: 1
    show_null_points: true
    interpolation: linear
    listen:
      Precio consulta: opt2024.max_price
      Año consulta: opt2024.years
      PH consulta: opt2024.PH
    row: 7
    col: 16
    width: 8
    height: 5
  - title: Total CO2
    name: Total CO2
    model: cars_price_and_co2
    explore: opt2024
    type: single_value
    fields: [opt2024.total_co2]
    limit: 500
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    listen:
      Precio consulta: opt2024.max_price
      Año consulta: opt2024.years
      PH consulta: opt2024.PH
    row: 0
    col: 0
    width: 7
    height: 2
  - title: Cobertura empleados
    name: Cobertura empleados
    model: cars_price_and_co2
    explore: opt2024
    type: single_value
    fields: [opt2024.count]
    limit: 500
    column_limit: 50
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    hidden_pivots: {}
    listen:
      Precio consulta: opt2024.max_price
      Año consulta: opt2024.years
      PH consulta: opt2024.PH
    row: 2
    col: 0
    width: 7
    height: 2
  - title: Emisiones promedio de CO2 vs cantidad de vehículos por marcas
    name: Emisiones promedio de CO2 vs cantidad de vehículos por marcas
    model: cars_price_and_co2
    explore: opt2024
    type: looker_line
    fields: [opt2024.vehicle_brand, opt2024.count, opt2024.average_co2]
    filters: {}
    sorts: [opt2024.count desc 0]
    limit: 500
    column_limit: 50
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    color_application: undefined
    y_axes: [{label: '', orientation: left, series: [{axisId: opt2024.total_co2, id: opt2024.total_co2,
            name: Total Co2}], showLabels: true, showValues: true, unpinAxis: false,
        tickDensity: default, tickDensityCustom: 5, type: linear}, {label: !!null '',
        orientation: right, series: [{axisId: opt2024.count, id: opt2024.count, name: Opt2024}],
        showLabels: true, showValues: true, unpinAxis: false, tickDensity: default,
        tickDensityCustom: 5, type: linear}]
    x_axis_zoom: true
    y_axis_zoom: true
    series_types:
      opt2024.count: column
      opt2024.average_co2: area
    series_colors:
      opt2024.count: "#7e5c5f"
      opt2024.average_co2: "#ff696f"
    series_labels:
      opt2024.count: count
    series_point_styles:
      opt2024.count: diamond
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    hidden_pivots: {}
    leftAxisLabelVisible: false
    leftAxisLabel: ''
    rightAxisLabelVisible: false
    rightAxisLabel: ''
    smoothedBars: false
    orientation: automatic
    labelPosition: left
    percentType: total
    percentPosition: inline
    valuePosition: right
    labelColorEnabled: false
    labelColor: "#FFF"
    up_color: false
    down_color: false
    total_color: false
    hidden_fields: []
    hidden_points_if_no: []
    value_labels: legend
    label_type: labPer
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    header_text_alignment: left
    header_font_size: 12
    rows_font_size: 12
    listen:
      Precio consulta: opt2024.max_price
      Año consulta: opt2024.years
      PH consulta: opt2024.PH
    row: 12
    col: 0
    width: 24
    height: 7
  - title: Resumen en General
    name: Resumen en General
    model: cars_price_and_co2
    explore: opt2024
    type: looker_grid
    fields: [opt2024.index, opt2024.vehicle_brand, opt2024.vehicle_model, opt2024.production_year,
      opt2024.user_type, opt2024.price, opt2024.power_hp, opt2024.average_co2]
    filters: {}
    sorts: [opt2024.average_co2]
    limit: 500
    column_limit: 50
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: true
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    truncate_header: false
    minimum_column_width: -1
    series_labels:
      opt2024.average_co2: Co2 emissions
    series_cell_visualizations:
      opt2024.average_co2:
        is_active: true
        palette:
          palette_id: 8f2b55d9-e04d-1e75-d20c-217ae712e3aa
          collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2
          custom_colors:
          - "#ffffff"
          - "#cb5761"
    limit_displayed_rows_values:
      show_hide: hide
      first_last: first
      num_rows: 0
    conditional_formatting: [{type: along a scale..., value: !!null '', background_color: "#1A73E8",
        font_color: !!null '', color_application: {collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2,
          custom: {id: 6488489e-90bc-df74-c909-647a8e7e65af, label: Custom, type: continuous,
            stops: [{color: "#FFFFFF", offset: 0}, {color: "#323030", offset: 100}]},
          options: {steps: 5}}, bold: false, italic: false, strikethrough: false,
        fields: [opt2024.price]}]
    truncate_column_names: false
    defaults_version: 1
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    listen:
      Precio consulta: opt2024.max_price
      Año consulta: opt2024.years
      PH consulta: opt2024.PH
    row: 0
    col: 7
    width: 17
    height: 7
  - type: button
    name: button_72
    rich_content_json: '{"text":"Planteamiento del problema","description":"","newTab":false,"alignment":"center","size":"medium","style":"FILLED","color":"#cb5761","href":"https://prociberneticadev.cloud.looker.com/dashboards/10"}'
    row: 6
    col: 0
    width: 7
    height: 1
  filters:
  - name: Precio consulta
    title: Precio consulta
    type: field_filter
    default_value: '10000000'
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
      options: []
    model: cars_price_and_co2
    explore: opt2024
    listens_to_filters: []
    field: opt2024.max_price
  - name: PH consulta
    title: PH consulta
    type: field_filter
    default_value: '150'
    allow_multiple_values: true
    required: true
    ui_config:
      type: dropdown_menu
      display: inline
      options:
      - '150'
      - '200'
      - '250'
      - '300'
      - '350'
      - '400'
    model: cars_price_and_co2
    explore: opt2024
    listens_to_filters: []
    field: opt2024.PH
  - name: Año consulta
    title: Año consulta
    type: field_filter
    default_value: '2024'
    allow_multiple_values: true
    required: true
    ui_config:
      type: radio_buttons
      display: inline
      options:
      - '2024'
      - '2025'
      - '2026'
      - '2027'
    model: cars_price_and_co2
    explore: opt2024
    listens_to_filters: []
    field: opt2024.years
