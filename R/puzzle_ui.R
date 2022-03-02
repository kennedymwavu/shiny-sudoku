puzzle_ui <- function(id) {
  tags$div(
    uiOutput(outputId = NS(namespace = id, id = "puzzle"))
  )
}
