#Conway's Game of Life
#Implemented by Nischal Kashyap: nkashya
#Simulate Game of Life for given number of Generations
def game_of_life2(rows,columns,grid,generations)
    puts "#{grid}"
    temp2 = Marshal.dump(grid)
    temp = Marshal.load(temp2)
    future = Marshal.load(temp2)
    for x in 1..generations
        puts "Generation #{x}"

        #Loop through each cell
        for i in 0..temp.length-1
            for j in 0..temp[i].length-1
                alive_neighbours = 0

                #Finding number of neighbours for current cell
                for a in -1..1
                    for b in -1..1

                        #Variables for counting Neighbors
                        x = 0
                        y = 0

                        #Current number of rows and columns
                        nx = temp.length-1
                        ny = temp[i].length-1

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
                        alive_neighbours = alive_neighbours + temp[x][y]
                    end
                end

                #Current cell to be subtracted to avoid duplicates
                alive_neighbours = alive_neighbours- temp[i][j]

                #Implenting rules of GOF

                #Lonely Cell dies
                if temp[i][j]==1 and alive_neighbours<2
                    future[i][j] = 0

                #Cell dies due to overcrowding
                elsif temp[i][j]==1 and alive_neighbours>3
                    future[i][j] = 0

                #A new cell is born if there are 3 neighbors
                elsif temp[i][j]==0 and alive_neighbours==3
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
	temp3 = Marshal.dump(future)
	temp = Marshal.load(temp3)
    end
    return future
end

File.open("log.txt", "a") { |f| f.write "\n#{Time.now} - Time the Program was Started\n"}
Test = 1
rows = 3
columns = 3

input1 = [[0,0,0,0,0,0],[0,0,1,1,0,0],[0,1,0,0,1,0],[0,0,1,1,0,0], [0,0,0,0,0,0]]
output1 = [[0,0,0,0,0,0],[0,0,1,1,0,0],[0,1,0,0,1,0],[0,0,1,1,0,0], [0,0,0,0,0,0]]
generation1 = 5

input2 = [[0,0,0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,0,0,0],[0,0,0,0,0,1,0,0,0,0,0],[0,0,0,0,0,1,0,0,0,0,0],[0,0,0,0,1,0,1,0,0,0,0],[0,0,0,0,0,1,0,0,0,0,0],[0,0,0,0,0,1,0,0,0,0,0],[0,0,0,0,0,1,0,0,0,0,0],[0,0,0,0,0,1,0,0,0,0,0],[0,0,0,0,1,0,1,0,0,0,0],[0,0,0,0,0,1,0,0,0,0,0],[0,0,0,0,0,1,0,0,0,0,0],[0,0,0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,0,0,0]]
output2 = [[0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0], [0, 0, 0, 0, 1, 0, 1, 0, 0, 0, 0], [0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0], [0, 0, 0, 0, 1, 0, 1, 0, 0, 0, 0], [0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]]
generation2 = 15

input3 = [[0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,0],[0,0,0,0,1,1,0,0,0],[0,0,1,1,0,1,1,0,0],[0,0,1,1,1,1,0,0,0],[0,0,0,1,1,0,0,0,0],[0,0,0,0,0,0,0,0,0]]
output3 = [[0, 0, 0, 0, 0, 0, 0, 0, 0], [0, 1, 0, 0, 0, 0, 0, 1, 0], [0, 0, 1, 0, 0, 0, 0, 0, 0], [0, 0, 1, 0, 0, 0, 0, 1, 0], [1, 1, 1, 0, 0, 0, 0, 0, 1], [0, 0, 0, 0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0, 0, 0, 0]]
generation3 = 11

flag = 1
while Test < 4
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

    alpha = game_of_life2 rows,columns,grid,generations
    if alpha == output
    result = "Test Case Number #{Test} has passed"
    else
    result = "Your Test Case Number #{Test} has failed!! The base Test Case has to pass in order for the program to run the backend cases"
    Test = 100
    flag = 0
    end
    puts "#{result}"

    File.open("log.txt", "a") { |f| f.write "#{Time.now} - Time the Program was Executed - Test Case #{Test} | Result - #{result}\n"}
    File.open("log.txt", "a") { |f| f.write "The output for the program is as follows \n #{output} \n"}
    Test += 1
    rows += 1
    columns += 1
end

if flag==1
puts "\nAll the test cases have passed!! The program has been successfully Debugged!!\n"
end
