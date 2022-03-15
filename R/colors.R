x <- matrix(data = 1:81, nrow = 9)

color2 <- "#d3d3d3"
color1 <- "#c0c0c0"

for (row in 1:9) {
  for (col in 1:9) {
    x[row, col] <- if (row <= 3 & col <= 3) {
      color1
    } else if (row <= 6 & col <= 3) {
      color2
    } else if (row > 6 & col <= 3) {
      color1
    }else if (row <= 3 & col <= 6) {
      color2
    } else if (row <= 6 & col <= 6) {
      color1
    } else if (row > 6 & col <= 6) {
      color2
    } else if (row <= 3 & col > 6) {
      color1
    } else if (row <= 6 & col > 6) {
      color2
    } else if (row > 6 & col > 6) {
      color1
    }
  }
}

x
