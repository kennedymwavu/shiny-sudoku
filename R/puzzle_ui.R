puzzle_ui <- function(id) {
  tags$div(
    class = "puzzle_container", 
    
    uiOutput(outputId = NS(namespace = id, id = "puzzle"))
  )
}
