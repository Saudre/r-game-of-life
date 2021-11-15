board_row <- 100
board_col <- 100

# Initial Game

get_game <- function() {
    game <- sample(c(1, 0), board_row * board_col, replace = TRUE)
    matrix_game <- matrix(data = game, nrow = board_row, ncol = board_col)
    return(matrix_game)
}

evaluate_rules <- function(cell, neighbors) {
    if (cell == 1 & (neighbors == 2 | neighbors == 3)) {
        return(1)
    } else if (cell == 0 & neighbors == 3) {
       return(1)
    } else {
        return(0)
    }
}

update_game <- function(your_matrix) {
    row_number <- nrow(your_matrix)
    col_number <- ncol(your_matrix)
    new_matrix <- matrix(0, nrow = row_number, ncol = col_number)

    for (i in 2:(row_number - 1)) {
        for (j in 2:(col_number - 1)) {
            live_neighbors <- sum(
                your_matrix[i - 1, j - 1],
                your_matrix[i - 1, j],
                your_matrix[i - 1, j + 1],
                your_matrix[i, j - 1],
                your_matrix[i, j + 1],
                your_matrix[i + 1, j - 1],
                your_matrix[i + 1, j],
                your_matrix[i + 1, j + 1]
            )
            new_matrix[i, j] <- evaluate_rules(your_matrix[i, j], live_neighbors)
        }
    }
    return(new_matrix)
}

simulation <- function() {
    game <- get_game()
    my_colors <- c(1, 5)
    windows(title = "Game of Life")
    frame()

    # Infinite loop

    while (dev.interactive()) {
        game <- update_game(game)
        par(mar = c(0, 0, 0, 0), new = TRUE)
        image(game, col = my_colors)
        grid(nx = board_row, ny = board_col, col = grey(0.3), lty = 1)
    }
}

simulation()