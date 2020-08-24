
# Conway's Game of Life

using Distributions
row = 5
col = 6
generations = 5
pop_percent = 0.619

function generate_input()
    grid = zeros(row,col)
    for i in 1:row
        for j in 1:col
            val = rand(Uniform(0.00,1.00))
            if val < pop_percent
                grid[i,j]=0
            else
                grid[i,j]=1
            end
        end
    end
    return grid
end
            

# Display the new generation
function output(row,col,future)
    for i in 1:row
        y=""
        for j in 1:col
            if future[i,j]==0.0
                y=string(y, ". ")
            else future[i,j]==1.0
                y=string(y, "@ ")
            end
        end
        println(y)
    end
end

# Simulate Game of Life for given number of Generations
function game_of_life(grid)
    future = deepcopy(grid)
    r,c = size(future)
    
    for x in 1:generations
        println("Generation:",x)
        
        # Loop through each cell
        for i in 1:r
            for j in 1:c
                alive_neighbors=0
                
                # Finding number of neighbours for current cell
                for a in -1:1
                    for b in -1:1
                        
                        # Variables for counting Neighbors
                        p = 0
                        q = 0
                        
                        # Current number of rows and columns
                        np = r
                        nq = c
                        
                        # Corner Cases including cyclic neighbors
                        # Top Left Corner
                        if i == 1 && j == 1
                            if i+a < 1 && j+b < 1
                                p = np
                                q = nq
                            elseif i+a < 1
                                p = np
                                q = j + b
                            elseif j+b < 1
                                p = i + a
                                q = nq
                            else
                                p = i + a
                                q = j + b
                            end
                        
                        # Top Right Corner
                        elseif i == 1 && j == nq
                            if i+a < 1 && j+b > nq
                                p = np
                                q = 1
                            elseif i+a < 1
                                p = np
                                q = j + b
                            elseif j+b > nq
                                p = i + a
                                q = 1
                            else
                                p = i + a
                                q = j + b
                            end
                        
                        # Bottom Right Corner
                        elseif i == np && j == nq
                            if i+a > np && j+b > nq
                                p = 1
                                q = 1
                            elseif i+a > np
                                p = 1
                                q = j + b
                            elseif j+b > nq
                                p = i + a
                                q = 1
                            else
                                p = i + a
                                q = j + b
                            end
                        
                        # Bottom Left Corner
                        elseif i == np && j == 1
                            if i+a > np && j+b < 1
                                p = 1
                                q = nq
                            elseif i+a > np
                                p = 1
                                q = j + b
                            elseif j+b < 1
                                p = i + a
                                q = nq
                            else
                                p = i + a
                                q = j + b
                            end
                        
                        # Edge Cases
                        # Top Edge
                        elseif i == 1 && i+a < 1
                            p = np
                            q = j + b
                        
                        # Bottom Edge
                        elseif i == np && i+a > np
                            p = 1
                            q = j + b
                         
                        # Left Edge
                        elseif j == 1 && j+b < 1
                            p = i + a
                            q = nq
                            
                        # Right Edge
                        elseif j == nq && j+b > nq
                            p = i + a
                            q = 1
                            
                        # Internal cells
                        else
                            p = i + a
                            q = j + b
                        end
                        
                        alive_neighbors+=future[p,q]
                    end
                end
                
                # Current cell to be subtracted to avoid duplicates
                alive_neighbors-=future[i,j]
                
                # Lonely Cell dies
                if future[i,j]==1 && alive_neighbors<2
                    future[i,j]=0
                
                # Cell dies due to overcrowding
                elseif future[i,j]==1 && alive_neighbors>3
                    future[i,j]=0
                
                # A new cell is born if there are 3 neighbors
                elseif future[i,j]==0 && alive_neighbors==3
                    future[i,j]=1
                
                end
            end
        end
    end
    output(r,c,future)
    return future
end





