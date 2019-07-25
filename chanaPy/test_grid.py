# -*- coding: utf-8 -*-

import sonok

import unittest

class TestChanaGrid(unittest.TestCase):
    
    def setUp(self):
        maker = sonok.SonakMaker(40)
        maker.build_grid()
        self.grid = maker.grid

        
    def test_end(self):
        self.assertEqual( self.grid[40][0].color, "dark green")
        self.assertEqual(self.grid[40][0].x_pos, 8)
        self.assertEqual(self.grid[40][0].y_pos, 8)
        self.assertEqual( self.grid[40][0].present,True)
        
    def test_middle(self):
        self.assertEqual(self.grid[25][1].color,  "light blue")
        self.assertEqual(self.grid[25][1].x_pos, 7)
        self.assertEqual(self.grid[25][1].y_pos , 6)
        self.assertEqual(self.grid[25][1].present, True)
    
    def test_beginning(self):
        self.assertEqual(self.grid[1][5].color, "orange")
        self.assertEqual(self.grid[1][5].x_pos, 6)
        self.assertEqual(self.grid[1][5].y_pos, 1)
        self.assertEqual(self.grid[1][5].present, True)


    def test_random(self):
        self.assertEqual(self.grid[11][7].color, "yellow")
        self.assertEqual(self.grid[11][7].x_pos, 1)
        self.assertEqual(self.grid[11][7].y_pos, 3)
        self.assertEqual(self.grid[11][7].present, True)


if __name__ == '__main__':
    unittest.main()

