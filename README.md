# Game of Life

The main goal of this project is to simulate the famous *Game of Life*, a cellular automaton created by **John Conway** using **R**. Visualizing the game in real-time with a finite but limitless board.

## Table of Contents

- [Technologies](#Technologies)
- [Status](#Technologies)
- [Launch](#Launch)
- [How to Use](#How)

## Technologies 
- R 3.6.3
- Windows

## Launch

Open the `game-of-life.r` file and run it.

The program will automatically open a new graphic window playing with the game.

If you are using a macOS system, within the function `simulation`, a function called `windows` calls the graphic device. You need to change that function by `quartz` in order to open the graphic device.

## How to use

You can control the number of cells by changing the values of `board_row` and `board_col`

Initially, The game has been set up with a square board with 10 thousand cells.

You can also easily control the cells' color. The const `my_color` within `simulation` function is a vector with two values `c(1, 5)` — the first value controls the color for the dead cells and the second one for the live cells. 


## Status

In progress