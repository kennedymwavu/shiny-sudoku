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
  tabItems(
    tabItem(
      tabName = "solver", 
      
      fluidRow(
        column(
          width = 12, 
          align = "center", 
          
          rHandsontableOutput(
            outputId = "sudoku"
          ) |> 
            withSpinner(
              type = 3, 
              color.background = "white"
            )
        )
      ), 
      
      fluidRow(
        column(
          width = 6, 
          align = "center", 
          
          actionButton(
            inputId = "get_new_sudoku", 
            label = "New Game", 
            class = "btn-warning"
          )
        ), 
        
        column(
          width = 6, 
          align = "center", 
          
          actionButton(
            inputId = "solve", 
            label = "Solve", 
            class = "btn-success"
          )
        )
      )
    )
  )
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
