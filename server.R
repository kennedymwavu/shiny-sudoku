server <- function(input, output, session) {
  # random_sudoku_server(id = "random_sudoku")
  puzzle_server(id = "puzzle")
  
  custom_sudoku_server(id = "custom_sudoku")
}

