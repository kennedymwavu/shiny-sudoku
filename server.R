server <- function(input, output, session) {
  random_sudoku_server(id = "random_sudoku")
  
  custom_sudoku_server(id = "custom_sudoku")
}

