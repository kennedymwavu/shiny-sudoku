pregenerated_server <- function(id) {
  moduleServer(
    id = id, 
    
    module = function(input, output, session) {
      # At app startup, generate a new sudoku:
      current_sudoku <- reactiveValues(
        initial = generateSudoku() |> 
          `colnames<-`(value = 1:9) |> 
          `rownames<-`(value = 1:9)
      )
      
      # What happens if user clicks `solve_sudoku`?
      observeEvent(input$solve_sudoku, {
        current_sudoku$initial <- input$sudoku |> 
          hot_to_r() |> 
          as.matrix() |> 
          solveSudoku(
            print.it = FALSE
          )
      })
      
      # What happens if user clicks `get_new_sudoku`?
      observeEvent(input$get_new_sudoku, {
        current_sudoku$initial <- generateSudoku()
      })
      
      # ----output----
      output$sudoku <- renderRHandsontable({
        current_sudoku$initial |> 
          `colnames<-`(value = 1:9) |>
          `rownames<-`(value = 1:9) |>
          rhandsontable() |> 
          hot_options()
      })
    }
  )
}