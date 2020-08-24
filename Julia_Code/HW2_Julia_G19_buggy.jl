import Dates
# Conway's Game of Life
using Distributions
row = 10
col = 10
generations = 15
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
    println(grid)
    println("####################################")
    return grid
end
       

# Display the new generation
function output_test(row,col,future)
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
function game_of_life_test(grid)
    future = deepcopy(grid)
    temp = deepcopy(grid)
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
                        
                        alive_neighbors+=temp[p,q]
                    end
                end
                
                # Current cell to be subtracted to avoid duplicates
                alive_neighbors = alive_neighbors - temp[i,j] - 1
                
                # Lonely Cell dies
                if temp[i,j]==1 && alive_neighbors<2
                    future[i,j]=1
                
                # Cell dies due to overcrowding
                elseif temp[i,j]==1 && alive_neighbors>3
                    future[i,j]=0
                
                # A new cell is born if there are 3 neighbors
                elseif temp[i,j]==0 && alive_neighbors==3
                    future[i,j]=0
                
                end
            end
        end
        output_test(r,c,future)
    end
    return future
end

function runtest(inp,out,num)
    test_out = game_of_life_test(inp)
    #orig_out = game_of_life(inp)
    println("*************************")
    println(test_out)
    println("*************************")
    #println(orig_out)
    #println("*************************")
    
    if test_out == out
        open("log.txt","a") do io
            println(io,Dates.now(), "  - Time the Program was Executed - Test Case ",num," | Result - Pass")
	    println(io,"Output=",test_out)
        end
    else
        open("log.txt","a") do io
            println(io,Dates.now(), "  - Time the Program was Executed - Test Case ",num," | Result - Fail")
            println(io,"Output=",test_out)
        end
    end
end

#runtest(generate_input())
#runtest(generate_input())
#runtest(generate_input())

Input1 = [0 0 0 0 0; 0 0 1 0 0; 0 0 1 0 0; 0 0 1 0 0; 0 0 0 0 0]
Input2 = [0 0 0 0 0 0; 0 0 0 1 0 0; 0 1 0 1 0 0; 0 0 1 1 0 0; 0 0 0 0 0 0]
Input3 = [0 0 0 0 0 0; 0 1 1 0 0 0; 0 1 0 0 0 0; 0 0 0 0 1 0; 0 0 0 1 1 0; 0 0 0 0 0 0]

Output1 = [0 0 0 0 0; 0 0 0 0 0; 0 1 1 1 0; 0 0 0 0 0; 0 0 0 0 0]
Output2 = [0 1 0 0 0 1; 1 1 0 0 0 0; 1 0 0 0 0 0; 0 0 0 0 0 0; 0 0 0 0 0 0]
Output3 = [0 0 0 0 0 0; 0 1 1 0 0 0; 0 1 1 0 0 0; 0 0 0 1 1 0; 0 0 0 1 1 0; 0 0 0 0 0 0]

runtest(Input1, Output1,1)
runtest(Input2, Output2,2)
runtest(Input3, Output3,3)




