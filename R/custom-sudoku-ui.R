custom_sudoku_ui <- function(id) {
  fluidRow(
    column(
      width = 12, 
      
      tags$div(
        style = "width: 50%; margin: auto;", 
        
        rHandsontableOutput(
          outputId = NS(namespace = id, id = "sudoku")
        ) |> 
          withSpinner(
            type = 3, 
            color.background = "white"
          ), 
        
        tags$br(), 
        
        fluidRow(
          align = "right", 
          
          column(
            width = 6, 
            
            tags$div(
              withBusyIndicatorUI(
                actionButton(
                  inputId = NS(namespace = id, id = "solve_sudoku"), 
                  label = "Solve", 
                  class = "btn-success", 
                  style = "width: 100px;"
                )
              )
            ), 
            
            tags$br(), 
            
            tags$div(
              withBusyIndicatorUI(
                actionButton(
                  inputId = NS(namespace = id, id = "clear_board"), 
                  label = "Clear", 
                  class = "btn-secondary", 
                  style = "width: 100px;"
                )
              )
            )
          )
        )
      )
    )
  )
}
