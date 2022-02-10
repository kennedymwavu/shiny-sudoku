# ----dashboardHeader----
header <- dashboardHeader(
  title = span(
    tagList(
      icon(
        name = "feather",
        class = "fa-solid fa-feather"
      ),
      "Sudoku"
    ), 
    style = "font-weight: 900; font-size: 150%;
            font-family: 'Open Sans', sans-serif;
        "
  )
)

# ----dashboardSidebar----
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

# ----dashboardBody----
body <- dashboardBody(
  tabItems(
    tabItem(
      tabName = "solver", 
      
      pregenerated_ui(id = "pregen")
    )
  )
)

# ----dashboardPage----
ui <- dashboardPage(
  title = "Sudoku Solver", 
  controlbar = NULL, 
  footer = NULL, 
  freshTheme = dashboard_theme, 
  
  header = header, 
  sidebar = sidebar, 
  body = body
)
