# HW2 Software Engineering : Game of Life Implementation

## Zenodo DOI Badge
[![DOI](https://zenodo.org/badge/289782467.svg)](https://zenodo.org/badge/latestdoi/289782467)

## Team Members:

#### Mangalnathan Vijayagopal (mvijaya2)

#### Nischal Badarinath Kashyap (nkashya)

#### Amogh Rameshappa Devapura (arames22)

#### Niranjan Pandeshwar (nrpandes)

#### Sharath Bangalore Ramesh Kumar (sbangal2)

## Rules of the game:

1.) Any live cell with two or three live neighbours survives.

2.) Any dead cell with three live neighbours becomes a live cell.

3.) All other live cells die in the next generation. Similarly, all other dead cells stay dead.


## Languages Used

1.) Ruby


2.) Swift


3.) Julia

## Data 
Before starting with the debugging, please fill out the following form

https://docs.google.com/forms/d/e/1FAIpQLScrQhfX3kqmytBmOxWYL9FlraeTvPFnBz_PGsqDC4MauucAYQ/viewform?usp=sf_link

## Pre requisites Required 

### Ruby
1) Ruby execution Environment has to be setup
2) Python3 execution Environment has to be setup
3) Git Module has to imported/installed on the system
4) Check fot ruby version using the command **ruby --version**
5) Check fot python3 version using the command **python3 --version**
6) Check fot git version using the command **git --version**


7) The bugs are introduced in the **game_of_life2** function.


8) The developer has to find the bugs and debug them.
9) Create an empty log file **log.txt** in the same directory where **execute.py** and **bug_fix_ruby.rb** is present if it does not exist.(Do this if the file is not present and you get error regarding this)
10) There is no need to run the ruby file individually. The developer has to correct the program and run the python file **execute.py** using the command **$python3 execute.py**
   
11) In log.txt file in line number 8 where file_list is defined, please enter the **absolute path** of the address of log.txt file.


12) There are three test cases introduced of which all have to be passed in order for the program to successfully compile.
13) The base test case has to be passed in order further move on to Test Case 2 and Test Case 3
14) The program may or may not contain syntax errors.
15) Every time the program is executed, time will be logged on the log.txt file.
16) The log.txt file is automatically updated on the github in the developer's branch each time the program is compiled.

### Swift
1) Swift execution environment has to be set up as shown here https://medium.com/@gigmuster/install-swift-5-0-on-ubuntu-18-04-86f6b96654

The steps for setup are as follows:

a) sudo apt-get install clang

b) sudo apt-get install libcurl4 libpython2.7 libpython2.7-dev

c) wget https://swift.org/builds/swift-5.0-release/ubuntu1804/swift-5.0-RELEASE/swift-5.0-RELEASE-ubuntu18.04.tar.gz

d) tar xzf swift-5.0-RELEASE-ubuntu18.04.tar.gz

e) sudo mv swift-5.0-RELEASE-ubuntu18.04 /usr/share/swift

f) echo "export PATH=/usr/share/swift/usr/bin:$PATH" >> ~/.bashrc

g) source  ~/.bashrc

Check fot swift version using the command **swift --version**

2) Git Module has to imported/installed on the system

3) The developer has to find the bugs and debug them

4) Swift program can be compiled by the command **swiftc -o <output_file_name> <swift_file>**

5) Then, the compiled file can be executed by **./<output_file_name>**

6) There are three test cases introduced of which all have to be passed in order for the program to successfully compile


7) The base test case has to be passed in order further move on to Test Case 2 and Test Case 3


8) The program may or may not contain syntax errors.


9) Every time the program is executed, time will be logged on the log.txt file.


10) The log.txt file is automatically updated on the github in the developer's branch each time the program is compiled.


## Metric Evaluation of the Developers

1) Every Developer's performance is analysed with respect to three major parameters

2) The first major parameter is with respect to the debugging time taken by the developer to complete the given task.

3) Here the task is considered to be completed if all the three test cases provided are passed successfully.

4) We request the developers to not run the program again if successfully completed.

5) The second parameter would be the Number of times the developer has compiled the code. The lesser the better.

6) The third parameter would be with respect to the responses given in the google forms

7) Please remember that this is solely for our analysis and should not be taken otherwise
