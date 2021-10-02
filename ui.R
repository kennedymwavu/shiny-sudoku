library(shiny)
library(sudoku)
library(rhandsontable)

# source files in /R:
files <- list.files("R", full.names = TRUE)

sapply(files, FUN = source)


ui <- navbarPage(
  title = "Shiny-Sudoku", 
  
  includeCSS("www/styles.css"), 
  
  # ----HOME----
  tabPanel(
    title = "Home", 
    icon = icon(name = "bank", class = "fa-solid fa-bank"), 
    div(
      "Input sudoku below:", 
      id = "askInput"
    ), 
    
    fluidRow(
      column(
        width = 12, 
        align = "center", 
        
        div(
          rHandsontableOutput(
            outputId = "userInput", 
            width = "100%", height = "100%"
          ), 
          
          style = "margin: auto; width = 50%"
        )
      )
    )
  ), 
  
  # ----DOCUMENTATION----
  # What did I use? Which packages? References
  tabPanel(
    title = "Documentation", 
    icon = icon(name = "book", class = "fa-solid fa-book")
  ), 
  
  # ----ABOUT----
  # Me, my contacts
  
  tabPanel(
    title = "About", 
    icon = icon(name = "question", class = "fa-solid fa-question")
  )
)