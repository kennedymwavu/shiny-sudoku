pregenerated_ui <- function(id) {
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
        
        actionButton(
          inputId = NS(namespace = id, id = "get_new_sudoku"), 
          label = "New Game", 
          class = "btn-warning"
        ), 
        
        actionButton(
          inputId = NS(namespace = id, id = "solve_sudoku"), 
          label = "Solve", 
          class = "btn-success"
        )
      )
    )
  )
}