board_row <- 100
board_col <- 100

get_game <- function () {
    game <- sample(c(1, 0), board_row * board_col, replace = TRUE)
    matrix_game <- matrix(data = game, nrow = board_row, ncol = board_col)
    return(matrix_game)
}