header <- dashboardHeader(
  
)

sidebar <- dashboardSidebar(
  sidebarMenu(
    menuItem(
      text = "Solver", 
      tabName = "solver"
    ), 
    
    menuItem(
      text = "About", 
      tabName = "about"
    )
  )
)

body <- dashboardBody(
  
)

ui <- dashboardPage(
  title = "Sudoku Solver", 
  controlbar = NULL, 
  footer = NULL, 
  freshTheme = dashboard_theme, 
  
  header = header, 
  sidebar = sidebar, 
  body = body
)
