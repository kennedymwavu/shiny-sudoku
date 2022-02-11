hot_options <- function(hotTable) {
  hotTable |> hot_table(highlightCol = TRUE, highlightRow = TRUE) |> 
    hot_cols(colWidths = 50, 
             renderer = "
           function (instance, td, row, col, prop, value, cellProperties) {
             Handsontable.renderers.NumericRenderer.apply(this, arguments);
             if (row < 3 && col < 3) {
              td.style.background = '#c0c0c0';
             } else if (row < 3 && col < 6) {
              td.style.background = '#d3d3d3';
             } else if (row < 3 && col < 9) {
              td.style.background = '#c0c0c0';
             } else if (row < 6 && col < 3) {
              td.style.background = '#d3d3d3';
             } else if (row < 6 && col < 6) {
           td.style.background = '#c0c0c0';
             } else if (row < 6 && col < 9) {
           td.style.background = '#d3d3d3';
             } else if (row < 9 && col < 3) {
           td.style.background = '#c0c0c0';
             } else if (row < 9 && col < 6) {
           td.style.background = '#d3d3d3';
             } else if (row < 9 && col < 9) {
           td.style.background = '#c0c0c0';
             }
           }") |> 
    hot_rows(rowHeights = 50) |> 
    hot_col(col = 1:9, format = "0", halign = "htCenter", valign = "htMiddle")
}
