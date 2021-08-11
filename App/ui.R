library(shiny)
library(sudoku)
library(rhandsontable)

# source files in /R:
files <- list.files("C:/Users/kenmw/OneDrive/Documents/Programming/Mwavu/R/Shiny projects/shiny-sudoku/R", full.names = TRUE)

sapply(files, FUN = source)


ui <- fillPage(
  navbarPage(
    title = "Shiny-Sudoku", 
    includeCSS("C:/Users/kenmw/OneDrive/Documents/Programming/Mwavu/R/Shiny projects/shiny-sudoku/www/styles.css"), 
    
    ######
    # Home: Main panel, solver & everything in here.
    ######
    tabPanel(
      title = "Home", 
      icon = icon(name = "bank", class = "fa-solid fa-bank"), 
      div(
        "Input sudoku below:", 
        id = "askInput"
      ), 
      
      fluidRow(
        column(
          width = 6, 
          
          rHandsontableOutput(
            outputId = "userInput"
          )
        )
      )
    ), 
    
    ###############
    # Documentation: What did I use? Which packages? References
    ###############
    tabPanel(
      title = "Documentation", 
      icon = icon(name = "book", class = "fa-solid fa-book")
    ), 
    
    #######
    # About: Me, my contacts
    #######
    tabPanel(
      title = "About", 
      icon = icon(name = "question", class = "fa-solid fa-question")
    )
  )
)