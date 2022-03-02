puzzle_server <- function(id) {
  moduleServer(
    id = id, 
    
    module = function(input, output, session) {
      output$puzzle <- renderUI({
        tags$div(
          class = "puzzle_container", 
          
          purrr::map(
            .x = 1:81, 
            .f = ~ tags$div(
              .x
            )
          )
        )
      })
    }
  )
}
