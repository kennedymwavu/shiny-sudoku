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
  ), 
  
  # Add icons & links in header:
  tags$li(
    tags$a(
      href = "https://github.com/kennedymwavu/shiny-sudoku", 
      target = "_blank", # make link open in new tab
      icon(
        name = "github", 
        class = "fab fa-github"
      ), 
      title = "GitHub", 
      style = "font-size: 140%;"
    ), 
    class = "dropdown"
  ), 
  
  tags$li(
    tags$a(
      href = "https://www.linkedin.com/in/mwavukennedy/", 
      target = "_blank", 
      icon(
        name = "linkedin", 
        class = "fa-brands fa-linkedn"
      ), 
      title = "LinkedIn",
      style = "font-size: 140%;"
    ), 
    class = "dropdown"
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
        text = "Random Puzzle", 
        tabName = "random"
      ), 
      
      menuSubItem(
        text = "Custom Puzzle", 
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
  
  # Fix header & sidebar:
  tags$script(HTML("$('body').addClass('fixed');")), 
  
  # Always scroll to top of any clicked tab:
  tags$script(
    '$(".sidebar-menu a[data-toggle=\'tab\']").click(function(){window.scrollTo({top: 0});})'
  ), 
  
  # Increase side bar menu font size:
  tags$style(HTML(".sidebar-menu>li>a>.fa { font-size: 20px; }")),
  
  tabItems(
    tabItem(
      tabName = "random", 
      
      random_sudoku_ui(id = "random_sudoku")
    ), 
    
    tabItem(
      tabName = "custom", 
      
      custom_sudoku_ui(id = "custom_sudoku")
    ), 
    
    tabItem(
      tabName = "about", 
      
      fluidRow(
        column(
          width = 12, 
          
          tags$div(
            style = "width: 50%; margin: auto;", 
            
            tags$h1("Hello!", align = "center"), 
            
            tags$br(), 
            
            tags$div(
              style = "font-size: 150%;", 
              
              includeMarkdown("about.md")
            )
          )
        )
      )
    )
  )
)

footer <- dashboardFooter(
  left = "Mwavu Kennedy"
)

# ----dashboardPage----
ui <- dashboardPage(
  title = "Sudoku Solver", 
  controlbar = NULL, 
  scrollToTop = TRUE, 
  footer = footer, 
  freshTheme = dashboard_theme, 
  options = list(sidebarExpandOnHover = TRUE), 
  
  header = header, 
  sidebar = sidebar, 
  body = body
)
