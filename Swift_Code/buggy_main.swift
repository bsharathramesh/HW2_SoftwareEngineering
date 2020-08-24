// Conway's Game of Life - Working Code (All Test Cases Passed)

// Foundation package for FileManager and Date Functions 
import Foundation

// Grid of Life
var grid = [[Int]]()

// Simulate Game of Life for given number of Generations
func gameOfLife(grid: [[Int]], generations: Int) -> [[Int]]
{
  var future: [[Int]] = grid
  var temp: [[Int]] = grid
	
  for var x in 1...generations{

    //print("\nGeneration \(x):\n")
    // Loop through each cell
    for var i in 0..<temp.count{
      for var j in 0..<temp[i].count{
        var aliveNeighbors = 0

        // Finding number of neighbours for current cell
        for var a in -1...1{
          for var b in -1...1{
            
            // Variables for counting Neighbors
            var x:Int = 0
            var y:Int = 0
            
            // Current number of rows and columns
            let nX = temp.count-1
            let nY = temp[i].count - 1

            // Corner Cases including cyclic neighbors
            // Top Left Corner
            if (i==0 && j==0)
            {
              if (i+a < 0 && j+b < 0){
                x = nX
                y = nY
              }
              else if((i + a) < 0)
              {
                x = nX
                y = j + b
              }
              else if((j + b) < 0)
              {
                x = i + a
                y = nY
              }
              else
              {
              x = i + a
              y = j + b
              }
            } 
            else if(i==0 && j==nY) // Top Right Corner
            {
              if ((i + a) < 0 && (j + b) > nY)
              {
                x = nX
                y = 0
              }
              else if((i + a) < 0)
              {
                x = nX
                y = j + b
              }
              else if((j + b) > nY)
              {
                x = i + a
                y = 0
              }
              else
              {
                x = i + a
                y = j + b
              }
            }
            else if (i==nX && j==nY) // Bottom Right Corner
            {
              if ((i + a)>nX && (j + b)>nY)
              {
                x = 0
                y = 0
              }
              else if((i + a) > nX)
              {
                x = 0
                y = j + b
              }
              else if((j + b) > nY)
              {
                x = i + a
                y = 0
              }
              else
              {
              x = i + a
              y = j + b
              }
            }
            else if (i==nX && j==0) // Bottom Left Corner
            {
              if ((i + a) > nX && (j + b) < 0)
              {
                x = 0
                y = nY
              }
              else if((i + a) > nX)
              {
                x = 0
                y = j + b
              }
              else if((j + b) < 0)
              {
                x = i + a
                y = nY
              }
              else
              {
                x = i + a
                y = j + b
              }
            }

            // Edge Cases
            else if(i==0 && i + a < 0) // Top Edge
            {
              x = nX
              y = j + b
            }
            else if(i==nX && i + a > nX) // Bottom Edge
            {
              x = 0
              y = j + b
            }
            else if(j==0 && j + b < 0) // Left Edge
            {
              x = i + a
              y = nY
            }
            else if(j==nY && j + b > nY) // Right Edge
            {
              x = i + a
              y = 0
            }
            else // Internal life
            {
              x = i + a
              y = j + b
            }
           // 
            aliveNeighbors = aliveNeighbors + temp[x][y]
          }
        }

        // Current cell to be subtracted to avoid duplicates
        aliveNeighbors = aliveNeighbors - temp[i][j] - 1  //*

        //Implenting rules of GOF
        
        //Lonely Cell dies
        if ((temp[i][j]==1) && (aliveNeighbors < 2)){
          future[i][j] = 0
        }
        // Cell dies due to overcrowding
        else if ((temp[i][j]==1) && (aliveNeighbors > 3)){
          future[i][j] = 0
        }
        // A new cell is born if there are 3 neighbors
        else if ((temp[i][j]==0) && (aliveNeighbors == 3)){
          future[i][j] = 0 //*
        }
      }
    }
	//*
  }
  return future
}

// Global Variables
var rows = 5
var cols = 5
var generation = 15
var populationPercent = 0.619

// Log file to store results of test cases
let urlString = "/home/mvijaya2/Mangal/log.txt"

let file = "log.txt" //Name of Log File

// Function to log to file.
func appendToFile(resultString: String)
{
  let data = resultString.data(using: String.Encoding.utf8)

  if let dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first 
  {
      let fileURL = dir.appendingPathComponent(file) 
      do 
      {
          if (!FileManager.default.fileExists(atPath: URL.init(string: urlString)!.path))
          {
            print("File Does not Exists. Creating a New File \n")
	          FileManager.default.createFile(atPath: URL.init(string: urlString)!.path, contents: data, attributes: nil)
          }
          else
          {
	          var file = FileHandle(forReadingAtPath: URL.init(string: urlString)!.path)
            let databuffer = String(describing: file?.readDataToEndOfFile())
            file = FileHandle(forWritingAtPath: URL.init(string: urlString)!.path)
       
	          if file != nil 
            {
              file?.seekToEndOfFile()
              file?.write(data!)
              file?.closeFile()
            }
  	      }    
       }
      catch {/* error handling here */}
  }
}

// Test Case 1
func testCase1() -> Bool
{

  var currentDate = Date()
  var runFlag: Bool
  let format = DateFormatter()
  format.timeZone = TimeZone(abbreviation: "EST")
  format.dateFormat = "yyyy-MM-dd HH:mm:ss"
  let dateString = format.string(from: currentDate)
  
  var resultString: String

  grid = [[0,0,0,0,0], [0,0,1,0,0], [0,0,1,0,0], [0,0,1,0,0], [0,0,0,0,0]]

  var result: [[Int]] = gameOfLife(grid: grid, generations: generation)
  
  var solution: [[Int]] = [[0,0,0,0,0], [0,0,0,0,0], [0,1,1,1,0],[0,0,0,0,0],[0,0,0,0,0]]

  if (result == solution)
  {
    runFlag = true
    resultString = "\n" + dateString + " - Time the Program was Executed - Test Case 1 | Result: True\n" 
      
  }
  else
  {
    runFlag = false
    resultString = "\n" + dateString + " - Time the Program was Executed - Test Case 1 | Result: False\n"
  }
 
    var matrixString: String
    matrixString = "\nResult:\n"
    for var a in 0..<result.count{
        matrixString.append("[")
        for var b in 0..<result[a].count {
                if(result[a][b]==1)
                {
                        matrixString.append(" 1 ")
                }else{
                        matrixString.append(" 0 ")
                }
        }
         matrixString.append("]\n")
        }
    matrixString = matrixString + "\nExpected:\n"
    for var a in 0..<solution.count{
        matrixString.append("[")
        for var b in 0..<solution[a].count {
                if(solution[a][b]==1)
                {
                        matrixString.append(" 1 ")
                }else{
                        matrixString.append(" 0 ")
                }
        }
         matrixString.append("]\n")
        }


  resultString = resultString + matrixString

  appendToFile(resultString: resultString)

  return runFlag
}



// Test Case 2
func testCase2() -> Bool
{

  var currentDate = Date()
  let format = DateFormatter()
  format.timeZone = TimeZone(abbreviation: "EST")
  format.dateFormat = "yyyy-MM-dd HH:mm:ss"
  let dateString = format.string(from: currentDate)
  var runFlag: Bool
  var resultString: String

  grid = [[0,0,0,0,0,0], [0,0,0,1,0,0], [0,1,0,1,0,0], [0,0,1,1,0,0], [0,0,0,0,0,0]]
  
  var result: [[Int]] = gameOfLife(grid: grid, generations: generation)
  var solution = [[0,1,0,0,0,1], [1,1,0,0,0,0], [1,0,0,0,0,0], [0,0,0,0,0,0], [0,0,0,0,0,0]]
  if (result == solution)
  {
    runFlag = true
    resultString = "\n" + dateString + " - Time the Program was Executed - Test Case 2 | Result: True\n"  
  }
  else
  {
    runFlag = false
    resultString = "\n" + dateString + " - Time the Program was Executed - Test Case 2 | Result: False\n"
  }
    var matrixString: String
    matrixString = "\nResult:\n"
    for var a in 0..<result.count{
        matrixString.append("[")
        for var b in 0..<result[a].count {
                if(result[a][b]==1)
                {
                        matrixString.append(" 1 ")
                }else{
                        matrixString.append(" 0 ")
                }
        }
         matrixString.append("]\n")
        }
    matrixString = matrixString + "\nExpected:\n"
    for var a in 0..<solution.count{
        matrixString.append("[")
        for var b in 0..<solution[a].count {
                if(solution[a][b]==1)
                {
                        matrixString.append(" 1 ")
                }else{
                        matrixString.append(" 0 ")
                }
        }
         matrixString.append("]\n")
        }
	
  resultString = resultString + matrixString

  appendToFile(resultString: resultString)

  return runFlag
}


// Test Case 3
func testCase3() -> Bool
{

  var currentDate = Date()
  let format = DateFormatter()
  format.timeZone = TimeZone(abbreviation: "EST")
  format.dateFormat = "yyyy-MM-dd HH:mm:ss"
  let dateString = format.string(from: currentDate)
  var runFlag: Bool
  var resultString: String

  grid = [[0,0,0,0,0,0], [0,1,1,0,0,0], [0,1,0,0,0,0], [0,0,0,0,1,0], [0,0,0,1,1,0], [0,0,0,0,0,0]]
  
  var result: [[Int]] = gameOfLife(grid: grid, generations: generation)
  var solution = [[0,0,0,0,0,0], [0,1,1,0,0,0], [0,1,1,0,0,0], [0,0,0,1,1,0], [0,0,0,1,1,0],[0,0,0,0,0,0]]
  
  if (result == solution)
  {
    runFlag = true
    resultString = "\n" + dateString + " - Time the Program was Executed - Test Case 3 | Result: True\n"  
  }
  else
  {
    runFlag = false
    resultString = "\n" + dateString + " - Time the Program was Executed - Test Case 3 | Result: False\n"
  }

    var matrixString: String
    matrixString = "\nResult:\n"
    for var a in 0..<result.count{
        matrixString.append("[")
        for var b in 0..<result[a].count {
                if(result[a][b]==1)
                {
                        matrixString.append(" 1 ")
                }else{
                        matrixString.append(" 0 ")
                }
        }
         matrixString.append("]\n")
        }
    matrixString = matrixString + "\nExpected:\n"
    for var a in 0..<solution.count{
        matrixString.append("[")
        for var b in 0..<solution[a].count {
                if(solution[a][b]==1)
                {
                        matrixString.append(" 1 ")
                }else{
                        matrixString.append(" 0 ")
                }
        }
         matrixString.append("]\n")
        }

  resultString = resultString + matrixString

  appendToFile(resultString: resultString)

  return runFlag
}


// Run all test cases. Stop if one fails
var pass_fail: Bool = testCase1()

if(pass_fail){

  pass_fail = testCase2()
  
  if(pass_fail)
  {
    pass_fail = testCase3()
    if(!pass_fail)
    {
      print("\n Test Case 3 Failed.")
    }
  }
  else
  {
    print("\n Test Case 2 Failed. Aborting.....\n")
  }

}
else
{
  print("\n Test Case 1 Failed. Aborting.....\n")
}
