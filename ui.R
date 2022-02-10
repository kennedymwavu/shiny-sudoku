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
      text = "SOLVE", 
      tabName = "solve", 
      startExpanded = TRUE, 
      
      menuSubItem(
        text = "Random", 
        tabName = "random"
      ), 
      
      menuSubItem(
        text = "Custom", 
        tabName = "custom"
      )
    ), 
    
    tags$hr(
      style="height:1px;border:none;color:#333;background-color:grey;"
    ), 
    
    menuItem(
      text = "ABOUT", 
      tabName = "about"
    )
  )
)

# ----dashboardBody----
body <- dashboardBody(
  # browser favicon:
  tags$head(
    tags$link(
      rel = "shortcut icon", 
      href = "feather.ico"
    )
  ), 
  
  tabItems(
    tabItem(
      tabName = "random", 
      
      random_sudoku_ui(id = "pregen")
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
