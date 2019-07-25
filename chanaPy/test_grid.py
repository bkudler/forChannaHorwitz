# -*- coding: utf-8 -*-

import sonok

def test_chana_grid():
    maker = sonok.SonakMaker(40)
    maker.build_grid()
    print("HEY")
    grid = maker.grid
    assert grid[40][0].color == "dark green"
    assert grid[40][0].x_pos == 8
    assert grid[40][0].y_pos == 8
    assert grid[40][0].present == True
    
    assert grid[25][1].color ==  "light blue"
    assert grid[25][1].x_pos ==  7
    assert grid[25][1].y_pos ==  6
    assert grid[25][1].present ==  True
  
    assert grid[1][5].color ==  "orange"
    assert grid[1][5].x_pos ==  6
    assert grid[1][5].y_pos ==  1
    assert grid[1][5].present ==  True

    assert grid[11][7].color ==  "yellow"
    assert grid[11][7].x_pos ==  1
    assert grid[11][7].y_pos ==  3
    assert grid[11][7].present ==  True



test_chana_grid();