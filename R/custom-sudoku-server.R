custom_sudoku_server <- function(id) {
  moduleServer(
    id = id, 
    
    module = function(input, output, session) {
      # initially render a matrix of all zeroes:
      current_sudoku <- reactiveValues(
        initial = matrix(
          data = 0, nrow = 9, ncol = 9
        )
      )
      
      # if user clicks `solve_sudoku`:
      observeEvent(input$solve_sudoku, {
        withBusyIndicatorServer("solve_sudoku", {
          current_sudoku$initial <- input$sudoku |> 
            hot_to_r() |> 
            as.matrix() |> 
            solveSudoku(
              print.it = FALSE
            )
        })
      })
      
      # if user clicks `clear_board`:
      observeEvent(input$clear_board, {
        withBusyIndicatorServer("clear_board", {
          current_sudoku$initial <- matrix(
            data = 0, nrow = 9, ncol = 9
          )
        })
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
