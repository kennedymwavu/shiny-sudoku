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
      icon = icon(
        name = "brain", 
        class = "fa-solid fa-brain"
      ), 
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
      tabName = "about", 
      icon = icon(
        name = "question", 
        class = "fa-solid fa-question"
      )
    )
  )
)

# ----dashboardBody----
body <- dashboardBody(
  shinyjs::useShinyjs(), 
  
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
      
      random_sudoku_ui(id = "random_sudoku")
    ), 
    
    tabItem(
      tabName = "custom", 
      
      custom_sudoku_ui(id = "custom_sudoku")
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
