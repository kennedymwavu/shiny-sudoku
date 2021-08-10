library(sudoku)

# Initial zeroed matrix:
initial <- matrix(data = 0, nrow = 9, ncol = 9)
rownames(initial) <- 1:9
colnames(initial) <- 1:9
initial <- rhandsontable(initial, width = "500px") |> 
  hot_table(customBorders = customBorders())

server <- function(input, output, session) {
  # Initial matrix:
  output$userInput <- renderRHandsontable({
    initial
  })
}

