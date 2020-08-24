#Conway's Game of Life
#Implemented by Nischal Kashyap: nkashya2

load "original.rb"

#Simulate Game of Life for given number of Generations
def game_of_life2(rows,columns,grid,generations)
    future = grid
    for x in 1..generations
        puts "Generation #{x}"

        #Loop through each cell
        for i in 0..future.length-1
            for j in 0..future[i].length-1
                alive_neighbours = 0

                #Finding number of neighbours for current cell
                for a in -1..1
                    for b in -1..1

                        #Variables for counting Neighbors
                        x = 0
                        y = 0

                        #Current number of rows and columns
                        nx = future.length-1
                        ny = future[i].length-1

                        #Corner Cases including cyclic neighbors
                        
                        #Top Left Corner
                        if i==0 and j==0
                            if i+a<0 and j+b<0
                                x=nx
                                y=ny
                            elsif i+a<0
                                x = nx
                                y = j+b
                            elsif j+b<0
                                x = i+a
                                y = ny
                            else
                                x = i+a
                                y = j+b
                            end

                        #Top Right Corner
                        elsif i==0 and j==ny
                            if i+a<0 and j+b>ny
                                x = nx
                                y = 0
                            elsif i+a<0
                                x = nx
                                y = j+b
                            elsif j+b>ny
                                x = i+a
                                y = 0
                            else
                                x = i+a
                                y = j+b
                            end

                        #Bottom Right Corner
                        elsif i==nx and j==ny
                            if i+a>nx and j+b>ny
                                x = 0
                                y = 0
                            elsif i+a>nx
                                x = 0
                                y = j+b
                            elsif j+b>ny
                                x = i+a
                                y = 0
                            else
                                x = i+a
                                y = j+b
                            end

                        #Bottom Left Corner
                        elsif i==nx and j==0
                            if i+a>nx and j+b<0
                                x = 0
                                y = ny
                            elsif i+a>nx
                                x = 0
                                y = j+b
                            elsif j+b<0
                                x = i+a
                                y = ny
                            else
                                x = i+a
                                y = j+b
                            end

                        #Edge Cases

                        #Top Edge
                        elsif i==0 and i+a<0
                            x = nx
                            y = j+b

                        #Bottom Edge
                        elsif i==nx and i+a>nx
                            x = 0
                            y = j+b

                        #Left Edge
                        elsif j==0 and j+b<0
                            x = i+a
                            y = ny

                        #Right Edge
                        elsif j==ny and j+b>ny
                            x = i+a
                            y = 0

                        #Internal life
                        else
                            x = i+a
                            y = j+b
                        end
                        alive_neighbours = alive_neighbours + future[x][y]
                    end
                end

                #Current cell to be subtracted to avoid duplicates
                alive_neighbours = alive_neighbours-future[i][j]

                #Implenting rules of GOF
                
                #Lonely Cell dies
                if future[i][j]==1 and alive_neighbours<2
                    future[i][j] = 0

                #Cell dies due to overcrowding
                elsif future[i][j]==1 and alive_neighbours>3
                    future[i][j] = 0

                #A new cell is born if there are 3 neighbors
                elsif future[i][j]==0 and alive_neighbours==3
                    future[i][j] = 1
                end
            end
        end

        #Display the new generation
        for a in 0..future.length-1
            for b in 0..future[a].length-1
                if future[a][b]==1
                    print "@ "
                else
                    print ". "
                end
            end
            puts ""
        end
    end
    return future
end


Test = 1
rows = 3
columns = 3

input1 = [[1,0,1,0],[1,0,0,0],[1,1,0,0],[0,0,0,1]]
output1 = [[1, 0, 0, 0], [1, 0, 0, 0], [1, 0, 0, 1], [1, 1, 0, 0]]
generation1 = 5

input2 = [[1,0,1,0,0,0,0,1,0,0],[0,0,1,1,0,0,0,1,0,1],[1,1,1,0,0,0,0,0,0,0],[0,0,1,0,0,0,0,1,0,1],[0,0,1,0,1,1,0,0,0,0],[0,0,0,0,0,1,0,1,1,0],[0,0,0,0,0,1,0,1,0,0],[0,0,1,1,0,1,0,0,0,0],[1,0,0,0,0,0,0,0,0,0],[0,1,1,1,0,0,0,0,1,0]]
output2 = [[1, 1, 0, 1, 1, 1, 0, 0, 0, 1], [0, 0, 0, 0, 0, 0, 0, 1, 0, 0], [0, 0, 0, 0, 0, 0, 1, 0, 1, 0], [0, 1, 0, 0, 0, 0, 1, 0, 1, 0], [1, 0, 1, 1, 1, 0, 0, 0, 1, 0], [0, 0, 1, 0, 1, 0, 1, 0, 1, 1], [0, 0, 1, 0, 1, 0, 0, 0, 1, 0], [1, 0, 1, 0, 1, 0, 1, 0, 0, 1], [1, 1, 1, 0, 1, 0, 0, 0, 1, 0], [0, 0, 0, 0, 0, 0, 1, 1, 1, 0]]
generation2 = 15

input3 = [[1,1,1,0,1,0,0,1,0],[0,0,0,0,1,0,0,0,1],[1,0,1,0,0,0,1,0,0],[0,0,1,0,1,0,0,1,0],[0,1,1,0,1,0,0,0,0],[0,0,1,0,1,0,0,0,1]]
output3 = [[0, 0, 0, 0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0, 0, 0, 0], [0, 0, 1, 1, 0, 0, 1, 1, 0], [0, 0, 1, 1, 0, 0, 1, 1, 0]]
generation3 = 7

while Test<4
    if Test == 1
        grid = input1
        output = output1
        generations = generation1
    end
    if Test == 2
        grid = input2
        output = output2
        generations = generation2
    end
    if Test == 3
        grid = input3
        output = output3
        generations = generation3
    end
    #Assign Randomly to Grid
    #grid = Array.new(rows){Array.new(columns)}
    #grid = [[0,0,0,0,0],[0,0,0,0,0], [0,1,1,1,0], [0,0,0,0,0], [0,0,0,0,0] ]
#     for i in 0..rows-1
#         for j in 0..columns-1
#             value = rand()<population_percentage
#             if value
#                 grid[i][j] = 0
#             else
#                 grid[i][j] = 1
#             end
#         end
#     end

    #Alternate Assignment in grid ( For Testing )

    # element = 1
    # grid = Array.new(rows){Array.new(columns)}
    # for i in 0..rows-1
    #     for j in 0..columns-1
    #         grid[i][j] = element
    #         element = 1-element
    #     end
    # end
    
    #Display Initial Grid
#     for i in 0..rows-1
#         for j in 0..columns-1
#             if grid[i][j]==1
#                 print "@ "
#             else
#                 print ". "
#             end
#         end
#         puts ""
#     end


    alpha = game_of_life2 rows,columns,grid,generations
    puts "Output is #{alpha}"
    if alpha == output
    result = "Pass"
    puts "#{result}"
    else
    result = "Fail"
    puts "#{result}"
    end

    File.open("log.txt", "a") { |f| f.write "#{Time.now} - Time the Program was Executed - Test Case #{Test} | Result - #{result}\n"}
    Test += 1
    rows += 1
    columns += 1
end
