# hot table custom borders:
customBorders <- function() {
  list(
    list(
      range = list(
          from = list(row = 1, col = 1),
          to = list(row = 2, col = 2)
        ),
    top = list(width = 2, color = "red"),
    left = list(width = 2, color = "red"),
    bottom = list(width = 2, color = "red"),
    right = list(width = 2, color = "red")
    ), 
    
    list(
      range = list(
        from = list(row = 3, col = 3), 
        to = list(row = 7, col = 7)
      ), 
      
      top = list(width = 2, color = "blue"), 
      left = list(width = 2, color = "blue"), 
      bottom = list(width = 2, color = "blue"), 
      right = list(width = 2, color = "blue")
    )
  )
}
