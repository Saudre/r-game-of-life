board_row <- 100
board_col <- 100

# Initial Game

get_game <- function() {
    game <- sample(c(1, 0), board_row * board_col, replace = TRUE)
    matrix_game <- matrix(data = game, nrow = board_row, ncol = board_col)
    return(matrix_game)
}

simulation <- function() {
    game <- get_game()
    my_colors <- c(1, 5)
    windows(title = "Game of Life")
    frame()

    # Infinite loop

    while (dev.interactive()) {
        par(mar = c(0, 0, 0, 0), new = TRUE)
        image(game, col = my_colors)
        grid(nx = board_row, ny = board_col, col = grey(0.3), lty = 1)
    }
}

simulation()