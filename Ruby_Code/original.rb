def game_of_life(rows,columns,grid,generations)
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
    return future
end