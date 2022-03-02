puzzle_ui <- function(id) {
  shiny::tagList(
    uiOutput(outputId = NS(namespace = id, id = "puzzle"))
  )
}
