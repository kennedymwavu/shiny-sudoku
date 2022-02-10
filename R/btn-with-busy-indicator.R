withBusyIndicatorCSS <- "
.btn-loading-container {
margin-left: 10px;
font-size: 1.2em;
}
.btn-done-indicator {
color: green;
}
.btn-err {
margin-top: 10px;
color: red;
}
"

#' Indicate when shiny is busy performing an activity (deletion, update etc).
#'
#' Wrap your action button with this on the ui side.
#'
#' @param button action button
#'
#' @return div of the said button but with a busy signal when necessary.
#' @export
#' @examples
#' ...,
#' withBusyIndicatorUI(
#' actionButton(
#'  inputId = "createNewYear",
#'  label = "Create",
#'  class = "btn-success",
#'  width = "90px"
#' )
#'),
#'...

withBusyIndicatorUI <- function(button) {
  id <- button[['attribs']][['id']]
  div(
    shinyjs::useShinyjs(),
    singleton(tags$head(
      tags$style(withBusyIndicatorCSS)
    )),
    `data-for-btn` = id,
    button,
    span(
      class = "btn-loading-container",
      shinyjs::hidden(
        icon("spinner", class = "btn-loading-indicator fa-spin"),
        icon("check", class = "btn-done-indicator")
      )
    ),
    shinyjs::hidden(
      div(class = "btn-err",
          div(icon("exclamation-circle"),
              tags$b("Error: "),
              span(class = "btn-err-msg")
          )
      )
    )
  )
}

#' Indicate when shiny is busy performing an activity (deletion, update etc).
#'
#' Call this function from the server with the button id that is clicked and the
#' expression to run when the button is clicked
#'
#' @param buttonId inputId of the action button.
#' @param expr expression to run when the button is clicked.
#'
#' @return div of the said button but with a busy signal when necessary.
#' @export
#' @examples
#' ...,
#' withBusyIndicatorServer("createNewYear", {
#'  add_new_year(input$newyear)
#'
#'  # Update the numeric input for new year:
#'  updateNumericInput(
#'   session,
#'   inputId = "newyear",
#'   value = least_year(),
#'   min = least_year(),
#'   max = least_year() + 10
#'  )
#'  }
#' ),
#'...


withBusyIndicatorServer <- function(buttonId, expr) {
  # UX stuff: show the "busy" message, hide the other messages, disable the button
  loadingEl <- sprintf("[data-for-btn=%s] .btn-loading-indicator", buttonId)
  doneEl <- sprintf("[data-for-btn=%s] .btn-done-indicator", buttonId)
  errEl <- sprintf("[data-for-btn=%s] .btn-err", buttonId)
  shinyjs::disable(buttonId)
  shinyjs::show(selector = loadingEl)
  shinyjs::hide(selector = doneEl)
  shinyjs::hide(selector = errEl)
  on.exit({
    shinyjs::enable(buttonId)
    shinyjs::hide(selector = loadingEl)
  })
  
  # Try to run the code when the button is clicked and show an error message if
  # an error occurs or a success message if it completes
  tryCatch({
    value <- expr
    shinyjs::show(selector = doneEl)
    shinyjs::delay(2000, shinyjs::hide(selector = doneEl, anim = TRUE, animType = "fade",
                                       time = 0.5))
    value
  }, error = function(err) { errorFunc(err, buttonId) })
}

#' Show error when it happens on button click.
#'
#' When using `withBusyIndicatorServer()` and `withBusyIndicatorUI` and error
#' arises, show it.
#'
#' @param err The error.
#' @param buttonId inputId of the action button.
#' @export
#' @seealso \code{\link{withBusyIndicatorServer}},
#' \code{\link{withBusyIndicatorUI}}
#'
# When an error happens after a button click, show the error
errorFunc <- function(err, buttonId) {
  errEl <- sprintf("[data-for-btn=%s] .btn-err", buttonId)
  errElMsg <- sprintf("[data-for-btn=%s] .btn-err-msg", buttonId)
  errMessage <- gsub("^ddpcr: (.*)", "\\1", err$message)
  shinyjs::html(html = errMessage, selector = errElMsg)
  shinyjs::show(selector = errEl, anim = TRUE, animType = "fade")
}