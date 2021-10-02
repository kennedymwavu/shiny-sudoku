library(sudoku)

# Initial zeroed matrix:
initial_m <- matrix(data = 0, nrow = 9, ncol = 9)
rownames(initial_m) <- 1:9
colnames(initial_m) <- 1:9
initial <- rhandsontable(initial_m, width = "500px", height = "600px", 
                         rowHeaderWidth = 30) |> 
  hotOptions()

server <- function(input, output, session) {
  # Initial matrix:
  output$userInput <- renderRHandsontable({
    initial
  })
}

