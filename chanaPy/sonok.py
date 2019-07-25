#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Sun Dec 23 18:34:50 2018

@author: bkudler
"""

class Square:
    
    def __init__(self, color,x_pos,y_pos, count, motion_time):
        self.color = color
        self.x_pos = x_pos
        self.y_pos = y_pos
        self.present = True
        self.count = count
        self.motion_time = motion_time  



class SingleGridMaker:
    
    def __init__(self,squares):
        self.squares = squares
        self.grid = []
        self.greatest_ys = {}


    def make_initial_grid(self, colors):
        first_grid = []
        for index, color in enumerate(colors):
            index = index + 1
            #8th square moves next
            count = 1 if index == 8 else 0
            s = Square(color,index,1,count, color)
            first_grid.append(s)
        return first_grid

    def make_new_square(self,square, new_x):
        raise NotImplementedError

    def update(self,square):
        raise NotImplementedError
        
        
    def update_square(self, square):
        x = square.x_pos
        count = square.count
        if (x == 8 or x == count) and count > -1:
            self.update(square)
        else:
            if count > -1:
                count += 1
            new_square = Square(square.color, square.x_pos, square.y_pos, count, None)
            new_square.present = square.present
            self.update_greatest_ys(new_square)
            self.grid.append(new_square)


    def update_greatest_ys(self, square):
        x = square.x_pos
        y = square.y_pos
        if x not in self.greatest_ys or self.greatest_ys[x] < y:
            self.greatest_ys[x] = y
        
        
    def clean_grid(self):
        grid = self.grid[:]
        for index, square in enumerate(grid):
            x = square.x_pos
            y = square.y_pos
            if y < self.greatest_ys[x]:
                square.present = False
            if square.present == False and square.count == -1:
                del self.grid[index]
        
        
    def make_next_grid(self):
        for square in self.squares:
            self.update_square(square)
            self.clean_grid()
        return self.grid
    
    

class SingleGridMakerUp(SingleGridMaker):


    def update(self,square):
        #direction is up so always add 1 and 8 becomes 1
        if square.x_pos == 8:
            new_x = 1
        else:
            new_x = square.x_pos + 1
        self.make_new_square(square, new_x)
        
    def make_new_square(self, square, new_x):
        #plus one because we are in an up instance
        new_square = Square(square.color, new_x , square.y_pos + 1, 0, square.color)
        orig_square = Square(square.color, square.x_pos, square.y_pos, -1, None)
        new_square.present = True
        orig_square.present = True
        self.update_greatest_ys(new_square)
        self.update_greatest_ys(orig_square)
        self.grid.extend((orig_square, new_square))

class SingleGridMakerDown(SingleGridMaker):


    def update(self,square):
        #direction is down so always subtract one and 1 becomes 8
        if square.x_pos == 1:
            new_x = 8
        else:
            new_x = square.x_pos - 1
        self.make_new_square(square, new_x)

    def make_new_square(self, square, new_x):
        #minus one because we are in a down instance
        new_square = Square(square.color, new_x , square.y_pos - 1, 0, square.color)
        orig_square = Square(square.color, square.x_pos, square.y_pos, -1, None)
        new_square.present = True
        orig_square.present = True
        self.update_greatest_ys(new_square)
        self.update_greatest_ys(orig_square)
        self.grid.extend((orig_square, new_square))

class SonakMaker:
    
    def __init__(self, length):
        self.length = length
        self.colors = ["dark green", "light blue", "dark blue", "purple", "rust", "orange","yellow", "light green"]
        self.grid = []
        
    def make_initial_single_grid(self):
        self.grid.append(SingleGridMaker(self.grid).make_initial_grid(self.colors))
    
    def change_direction(self, pos):
        last_grid = self.grid[-1]
        direction_change = True
        i = 0
        #every square is in the 8th position or the 1st position
        while(i < len(last_grid) and direction_change == True): 
            if(last_grid[i].y_pos != pos and last_grid[i].present == True):
                direction_change = False
            i += 1
        return direction_change

    def exact_direction(self):
        go_up = self.change_direction(1)
        go_down = self.change_direction(8)
        if go_up:
            return 1
        elif go_down:
            return -1

    def get_direction(self):
        if self.change_direction(1) or self.change_direction(8):
            return self.exact_direction()
        else:
            return False

        
        
    def build_grid(self):
        self.make_initial_single_grid()  
        direction = 1
        for i in range(0,self.length):
            direction_change = self.get_direction()
            direction = direction_change if direction_change else direction
            last_grid = self.grid[-1]
            if direction == 1:
                grid_maker = SingleGridMakerUp(last_grid)
            elif direction == -1:
                grid_maker = SingleGridMakerDown(last_grid)
            new_grid = grid_maker.make_next_grid()
            self.grid.append(new_grid)
            
    def get_x(self,square):
        return square.x_pos
    
    def pretty_print(self):      
        for index, grid in enumerate(self.grid):
            print ("------------",index+1,"-------------")
            grid.sort(key=self.get_x)
            for square in grid:
                if square.present:
                    print(square.color,"x:",square.x_pos,"y:",square.y_pos)



#s = SonakMaker(39)
#s.build_grid()
#s.pretty_print()