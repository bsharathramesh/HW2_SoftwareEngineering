load "original.rb"
def game_of_life2(rows,columns,grid,generations)
    future = grid
    for x in 1..generations
        puts "Generation #{x}"
        for i in 0..future.length-1
            for j in 0..future[i].length-1
                alive_neighbours = 0
                for a in -1..1
                    for b in -1..1
                        x = 0
                        y = 0
                        nx = future.length-1
                        ny = future[i].length-1
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
                        elsif i==0 and i+a<0
                            x = nx
                            y = j+b
                        elsif i==nx and i+a>nx
                            x = 0
                            y = j+b
                        elsif j==0 and j+b<0
                            x = i+a
                            y = ny
                        elsif j==ny and j+b>ny
                            x = i+a
                            y = 0
                        else
                            x = i+a
                            y = j+b
                        end
                        alive_neighbours = alive_neighbours + future[x][y]
                    end
                end
                alive_neighbours = alive_neighbours-future[i][j]

                if future[i][j]==1 and alive_neighbours<2
                    future[i][j] = 0
                elsif future[i][j]==1 and alive_neighbours>3
                    future[i][j] = 0
                elsif future[i][j]==0 and alive_neighbours==3
                    future[i][j] = 1
                end
            end
        end
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
    return future[-1]
end

Test = 1
rows = 3
columns = 3
while rows<=5
    generations = 25
    population_percentage = 0.437

    grid = Array.new(rows){Array.new(columns)}
    #grid = [[0,0,0,0,0],[0,0,0,0,0], [0,1,1,1,0], [0,0,0,0,0], [0,0,0,0,0] ]
    for i in 0..rows-1
        for j in 0..columns-1
            value = rand()<population_percentage
            if value
                grid[i][j] = 0
            else
                grid[i][j] = 1
            end
        end
    end

    # element = 1
    # grid = Array.new(rows){Array.new(columns)}
    # for i in 0..rows-1
    #     for j in 0..columns-1
    #         grid[i][j] = element
    #         element = 1-element
    #     end
    # end

    for i in 0..rows-1
        for j in 0..columns-1
            if grid[i][j]==1
                print "@ "
            else
                print ". "
            end
        end
        puts ""
    end


    alpha = game_of_life2 rows,columns,grid,generations
    beta = game_of_life rows,columns,grid,generations

    puts "Rows = #{rows}"
    if alpha == beta
    result = "Pass"
    puts "#{result}"
    else
    result = "Fail"
    puts "#{result}"
    end

    File.open("log.txt", "w") { |f| f.write "#{Time.now} - Time the Program was Executed - Test Case #{Test} | Result - #{result}\n"}
    Test += 1
    rows += 1
    columns += 1
end