dashboard_theme <- create_theme(
  theme = "flatly", 
  
  adminlte_color(
    light_blue = "#434C5E"
  ),
  
  adminlte_sidebar(
    width = "200px",
    dark_bg = "#D8DEE9",
    dark_hover_bg = "#81A1C1",
    dark_color = "#2E3440", 
    
    dark_submenu_bg = "#D8DEE9", 
    dark_submenu_color = "#2E3440", 
    dark_submenu_hover_color = "green"
  ),
  
  adminlte_global(
    content_bg = "#FFF",
    box_bg = "#D8DEE9",
    info_box_bg = "#D8DEE9"
  )
)
