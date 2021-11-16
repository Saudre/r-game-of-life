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

update_game <- function(board) {
    row_number <- nrow(board)
    col_number <- ncol(board)
    new_board <- matrix(0, nrow = row_number, ncol = col_number)

    # Top-left-corner

    live_neighbors <- sum(
        board[row_number, col_number],
        board[row_number, 1],
        board[row_number, 2],
        board[1, col_number],
        board[1, 2],
        board[2, col_number],
        board[2, 1],
        board[2, 2]
        )

    new_board[1, 1] <- evaluate_rules(board[1, 1], live_neighbors)

    # Top

    for (j in 2:(col_number - 1)) {
        live_neighbors <- sum(
            board[row_number, j - 1],
            board[row_number, j],
            board[row_number, j + 1],
            board[1, j - 1],
            board[1, j + 1],
            board[2, j - 1],
            board[2, j],
            board[2, j + 1]
        )
        new_board[1, j] <- evaluate_rules(board[1, j], live_neighbors)
    }

    # Top-right-corner

    live_neighbors <- sum(
        board[row_number, (col_number - 1)],
        board[row_number, col_number],
        board[row_number, 1],
        board[1, (col_number - 1)],
        board[1, 1],
        board[2, (col_number - 1)],
        board[2, col_number],
        board[2, 1]
    )

    new_board[1, col_number] <- evaluate_rules(board[1, col_number], live_neighbors)

    # left

    for (i in 2:(row_number - 1)) {
        live_neighbors <- sum(
            board[i - 1, col_number],
            board[i - 1, 1],
            board[i - 1, 2],
            board[i, col_number],
            board[i, 2],
            board[i + 1, col_number],
            board[i + 1, 1],
            board[i + 1, 2]
        )
        new_board[i, 1] <- evaluate_rules(board[i, 1], live_neighbors)
    }

    # Center

    for (i in 2:(row_number - 1)) {
        for (j in 2:(col_number - 1)) {
            live_neighbors <- sum(
                board[i - 1, j - 1],
                board[i - 1, j],
                board[i - 1, j + 1],
                board[i, j - 1],
                board[i, j + 1],
                board[i + 1, j - 1],
                board[i + 1, j],
                board[i + 1, j + 1]
            )
            new_board[i, j] <- evaluate_rules(board[i, j], live_neighbors)
        }
    }

    # right-side

    for (i in 2:(row_number - 1)) {
        live_neighbors <- sum(
            board[i - 1, (col_number - 1)],
            board[i - 1, col_number],
            board[i - 1, 1],
            board[i, (col_number - 1)],
            board[i, 1],
            board[i + 1, (col_number - 1)],
            board[i + 1, col_number],
            board[i + 1, 1]
        )
        new_board[i, col_number] <- evaluate_rules(board[i, col_number], live_neighbors)
    }

    # bottom

    for (j in 2:(col_number - 1)) {
        live_neighbors <- sum(
            board[(row_number - 1), j - 1],
            board[(row_number - 1), j],
            board[(row_number - 1), j + 1],
            board[row_number, j - 1],
            board[row_number, j + 1],
            board[1, j - 1],
            board[1, j],
            board[1, j + 1]
        )
        new_board[row_number, j] <- evaluate_rules(board[row_number, j], live_neighbors)
    }

    return(new_board)
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