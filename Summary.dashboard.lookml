- dashboard: summary_dashboard
  title: Summary Dashboard
  layout: newspaper
  preferred_viewer: dashboards-next
  elements:
  - title: Total Revenue for the Last Day
    name: Total Revenue for the Last Day
    model: looker_intensive3_kalcho_nikolaev
    explore: order_items
    type: single_value
    fields: [order_items.total_gross_revenue]
    filters:
      order_items.created_date: 1 days ago for 1 days
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
    series_types: {}
    defaults_version: 1
    row: 2
    col: 0
    width: 6
    height: 4
  - title: New Customer for the Last Completed Day
    name: New Customer for the Last Completed Day
    model: looker_intensive3_kalcho_nikolaev
    explore: order_items
    type: single_value
    fields: [users.count]
    filters:
      users.created_date: 1 days ago for 1 days
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
    series_types: {}
    defaults_version: 1
    listen: {}
    row: 2
    col: 6
    width: 6
    height: 4
  - title: Gross Margin % Over the Last 30 Days
    name: Gross Margin % Over the Last 30 Days
    model: looker_intensive3_kalcho_nikolaev
    explore: order_items
    type: single_value
    fields: [order_items.Gross_Margin_Percent]
    filters:
      order_items.created_date: 30 days ago for 30 days
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
    series_types: {}
    defaults_version: 1
    listen: {}
    row: 2
    col: 12
    width: 6
    height: 4
  - title: Average Spend per Customer in the Last 30 Days
    name: Average Spend per Customer in the Last 30 Days
    model: looker_intensive3_kalcho_nikolaev
    explore: order_items
    type: single_value
    fields: [order_items.average_spend_per_customer]
    filters:
      order_items.created_date: 30 days ago for 30 days
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
    series_types: {}
    defaults_version: 1
    row: 2
    col: 18
    width: 6
    height: 4
  - name: Yearly Trends
    type: text
    title_text: Yearly Trends
    subtitle_text: ''
    body_text: ''
    row: 6
    col: 0
    width: 24
    height: 2
  - name: KPIs
    type: text
    title_text: KPIs
    subtitle_text: ''
    body_text: ''
    row: 0
    col: 0
    width: 24
    height: 2
  - title: By Week Performance Last 4 Years
    name: By Week Performance Last 4 Years
    model: looker_intensive3_kalcho_nikolaev
    explore: order_items
    type: looker_line
    fields: [order_items.created_year, order_items.total_gross_revenue, order_items.created_week_of_year]
    pivots: [order_items.created_year]
    fill_fields: [order_items.created_year, order_items.created_week_of_year]
    filters:
      order_items.created_year: 4 years
    sorts: [order_items.created_year desc, order_items.total_gross_revenue desc 0]
    limit: 500
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
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    series_types: {}
    listen: {}
    row: 8
    col: 0
    width: 24
    height: 8
  - title: Revenue vs Profit Last 12 Months
    name: Revenue vs Profit Last 12 Months
    model: looker_intensive3_kalcho_nikolaev
    explore: order_items
    type: looker_line
    fields: [order_items.total_gross_revenue, order_items.Gross_Margin_Percent, order_items.created_month]
    fill_fields: [order_items.created_month]
    filters:
      order_items.created_year: 12 months
    sorts: [order_items.created_month desc]
    limit: 500
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
    y_axes: [{label: '', orientation: left, series: [{axisId: order_items.total_gross_revenue,
            id: order_items.total_gross_revenue, name: Total Gross Revenue}], showLabels: true,
        showValues: true, unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}, {label: !!null '', orientation: right, series: [{axisId: order_items.Gross_Margin_Percent,
            id: order_items.Gross_Margin_Percent, name: Gross Margin %}], showLabels: true,
        showValues: true, unpinAxis: true, tickDensity: default, tickDensityCustom: 5,
        type: linear}]
    defaults_version: 1
    row: 16
    col: 0
    width: 24
    height: 7
  - title: New Customers in the Last 2 Months
    name: New Customers in the Last 2 Months
    model: looker_intensive3_kalcho_nikolaev
    explore: order_items
    type: looker_line
    fields: [order_items.current_vs_previous_period_snowflake, users.count, days_of_the_month]
    pivots: [order_items.current_vs_previous_period_snowflake]
    filters:
      parameters.select_timeframe: month
      users.created_month: 2 months
    sorts: [order_items.current_vs_previous_period_snowflake desc, users.count desc
        0]
    limit: 500
    dynamic_fields: [{dimension: days_of_the_month, _kind_hint: dimension, _type_hint: number,
        category: dimension, expression: 'extract_days(${order_items.created_date})',
        label: Days of the Month, value_format: !!null '', value_format_name: !!null ''},
      {dimension: mtd_filter, _kind_hint: dimension, _type_hint: yesno, category: dimension,
        expression: 'extract_days(${users.created_date}) <= extract_days(now())',
        label: MTD Filter, value_format: !!null '', value_format_name: !!null ''}]
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
    defaults_version: 1
    series_types: {}
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: 12
    rows_font_size: 12
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    listen: {}
    row: 25
    col: 0
    width: 18
    height: 7
  - name: Customer Analysis
    type: text
    title_text: Customer Analysis
    subtitle_text: ''
    body_text: ''
    row: 23
    col: 0
    width: 24
    height: 2
  - title: New Customers - MTD
    name: New Customers - MTD
    model: looker_intensive3_kalcho_nikolaev
    explore: order_items
    type: looker_column
    fields: [order_items.current_vs_previous_period_snowflake, users.count]
    filters:
      parameters.select_timeframe: month
      users.created_month: 2 months
      mtd_filter: 'Yes'
    sorts: [order_items.current_vs_previous_period_snowflake desc]
    limit: 500
    dynamic_fields: [{dimension: days_of_the_month, _kind_hint: dimension, _type_hint: number,
        category: dimension, expression: 'extract_days(${order_items.created_date})',
        label: Days of the Month, value_format: !!null '', value_format_name: !!null ''},
      {dimension: mtd_filter, _kind_hint: dimension, _type_hint: yesno, category: dimension,
        expression: 'extract_days(${users.created_date}) <= extract_days(now())',
        label: MTD Filter, value_format: !!null '', value_format_name: !!null ''}]
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
    value_labels: legend
    label_type: labPer
    series_labels: {}
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: progress_percentage
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    series_types: {}
    show_null_points: true
    interpolation: linear
    defaults_version: 1
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
    hidden_fields: []
    hidden_points_if_no: []
    listen: {}
    row: 25
    col: 18
    width: 6
    height: 7
  - title: Demographics
    name: Demographics
    model: looker_intensive3_kalcho_nikolaev
    explore: order_items
    type: looker_donut_multiples
    fields: [users.gender, users.age_tier, order_items.total_gross_revenue]
    pivots: [users.age_tier]
    fill_fields: [users.age_tier]
    sorts: [order_items.total_gross_revenue desc 0, users.age_tier]
    limit: 500
    show_value_labels: true
    font_size: 12
    color_application:
      collection_id: b43731d5-dc87-4a8e-b807-635bef3948e7
      palette_id: 4a543302-b64d-409c-9863-679b5b230aac
      options:
        steps: 5
    series_colors: {}
    series_types: {}
    defaults_version: 1
    row: 32
    col: 0
    width: 24
    height: 6
  - title: New Customer? Gross Revenue over the Last 90 Days
    name: New Customer? Gross Revenue over the Last 90 Days
    model: looker_intensive3_kalcho_nikolaev
    explore: order_items
    type: looker_area
    fields: [users.is_new_customers, order_items.total_gross_revenue, order_items.created_week]
    pivots: [users.is_new_customers]
    fill_fields: [users.is_new_customers, order_items.created_week]
    filters:
      order_items.created_date: 90 days
    sorts: [users.is_new_customers, order_items.created_week desc]
    limit: 500
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
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    color_application:
      collection_id: b43731d5-dc87-4a8e-b807-635bef3948e7
      palette_id: ccba75a3-58c7-4b9c-a931-4ffc59e79cba
      options:
        steps: 5
    font_size: '12'
    series_types: {}
    series_colors: {}
    series_labels: {}
    defaults_version: 1
    ordering: none
    show_null_labels: false
    groupBars: true
    labelSize: 10pt
    showLegend: true
    up_color: "#3EB0D5"
    down_color: "#B1399E"
    total_color: "#C2DD67"
    hidden_fields: []
    hidden_points_if_no: []
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
    map: usa
    map_projection: ''
    map_plot_mode: points
    heatmap_gridlines: false
    heatmap_gridlines_empty: false
    heatmap_opacity: 0.5
    show_region_field: true
    draw_map_labels_above_data: true
    map_tile_provider: light
    map_position: fit_data
    map_scale_indicator: 'off'
    map_pannable: true
    map_zoomable: true
    map_marker_type: circle
    map_marker_icon_name: default
    map_marker_radius_mode: proportional_value
    map_marker_units: meters
    map_marker_proportional_scale_type: linear
    map_marker_color_mode: fixed
    show_legend: true
    quantize_map_value_colors: false
    reverse_map_value_colors: false
    value_labels: legend
    label_type: labPer
    row: 38
    col: 0
    width: 24
    height: 6
  - title: Best Source of New Customer? - Absolute Values (Last 90 Days)
    name: Best Source of New Customer? - Absolute Values (Last 90 Days)
    model: looker_intensive3_kalcho_nikolaev
    explore: order_items
    type: looker_grid
    fields: [users.traffic_source, users.is_new_customers, order_items.total_gross_revenue]
    pivots: [users.is_new_customers]
    fill_fields: [users.is_new_customers]
    filters:
      order_items.created_date: 90 days
    sorts: [order_items.total_gross_revenue desc 0, users.is_new_customers]
    limit: 500
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: 12
    rows_font_size: 12
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
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
    defaults_version: 1
    series_types: {}
    value_labels: legend
    label_type: labPer
    hidden_fields: []
    hidden_points_if_no: []
    series_labels: {}
    font_size: 12
    listen: {}
    row: 44
    col: 12
    width: 12
    height: 4
  - title: Best Source of New Customer? - % Acquisition (Last 90 Days)
    name: Best Source of New Customer? - % Acquisition (Last 90 Days)
    model: looker_intensive3_kalcho_nikolaev
    explore: order_items
    type: looker_donut_multiples
    fields: [users.traffic_source, users.is_new_customers, order_items.total_gross_revenue]
    pivots: [users.is_new_customers]
    fill_fields: [users.is_new_customers]
    filters:
      order_items.created_date: 90 days
    sorts: [order_items.total_gross_revenue desc 0, users.is_new_customers]
    limit: 500
    show_value_labels: false
    font_size: 12
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
    series_types: {}
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: 12
    rows_font_size: 12
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    value_labels: legend
    label_type: labPer
    hidden_fields: []
    hidden_points_if_no: []
    series_labels: {}
    listen: {}
    row: 44
    col: 0
    width: 12
    height: 11
  - title: Top 10 Products (Last 90 Days)
    name: Top 10 Products (Last 90 Days)
    model: looker_intensive3_kalcho_nikolaev
    explore: order_items
    type: looker_grid
    fields: [products.brand, order_items.total_gross_revenue, order_items.Gross_Margin_Percent]
    filters:
      order_items.created_date: 90 days
    sorts: [order_items.total_gross_revenue desc]
    limit: 10
    total: true
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    series_cell_visualizations:
      order_items.total_gross_revenue:
        is_active: true
        palette:
          palette_id: 471a8295-662d-46fc-bd2d-2d0acd370c1e
          collection_id: b43731d5-dc87-4a8e-b807-635bef3948e7
      order_items.Gross_Margin_Percent:
        is_active: true
        palette:
          palette_id: 1e4d66b9-f066-4c33-b0b7-cc10b4810688
          collection_id: b43731d5-dc87-4a8e-b807-635bef3948e7
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
    defaults_version: 1
    series_types: {}
    row: 48
    col: 12
    width: 12
    height: 7
  - title: Most Profitable States in the Last 90 Days
    name: Most Profitable States in the Last 90 Days
    model: looker_intensive3_kalcho_nikolaev
    explore: order_items
    type: looker_map
    fields: [users.state, order_items.total_gross_margin_amount]
    filters:
      order_items.created_date: 90 days
      users.country: USA
    sorts: [order_items.total_gross_margin_amount desc]
    limit: 500
    map_plot_mode: points
    heatmap_gridlines: false
    heatmap_gridlines_empty: false
    heatmap_opacity: 0.5
    show_region_field: true
    draw_map_labels_above_data: true
    map_tile_provider: light
    map_position: custom
    map_scale_indicator: 'off'
    map_pannable: true
    map_zoomable: true
    map_marker_type: circle
    map_marker_icon_name: default
    map_marker_radius_mode: proportional_value
    map_marker_units: meters
    map_marker_proportional_scale_type: linear
    map_marker_color_mode: fixed
    show_view_names: false
    show_legend: true
    quantize_map_value_colors: false
    reverse_map_value_colors: false
    series_types: {}
    defaults_version: 1
    map_latitude: 35.38904996691167
    map_longitude: -97.69042968750001
    map_zoom: 4
    row: 55
    col: 0
    width: 24
    height: 10
