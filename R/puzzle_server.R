puzzle_server <- function(id) {
  moduleServer(
    id = id, 
    
    module = function(input, output, session) {
      output$puzzle <- renderUI({
        purrr::map(
          .x = 1:81, 
          .f = ~ tags$div(
            .x
          )
        )
      })
    }
  )
}
