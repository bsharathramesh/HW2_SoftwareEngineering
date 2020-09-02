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


4.) Each edge considers its opposite edge as its neighbour.


## Languages Used

1.) Ruby


2.) Swift


3.) Julia


## Data 
Before starting with the debugging, please fill out the following form

https://docs.google.com/forms/d/e/1FAIpQLScrQhfX3kqmytBmOxWYL9FlraeTvPFnBz_PGsqDC4MauucAYQ/viewform?usp=sf_link


## Pre requisites Required 

1.) Please reserve a VCL here https://vcl.ncsu.edu/scheduling/ (Build: Ubuntu 18.04 LTS Base) or a MAC OS


2.) Clone the specific branch for testing using the command `git clone --single-branch --branch <your_unity_ID> https://github.com/bsharathramesh/HW2_SE2020_Testing.git`


3.) Pull the buggy code from the master branch using the command `git pull origin master`


4.) Install pip CLI using `sudo apt install python3-pip`


5.) Install GitHub CLI using `pip3 install gitpython`


For each of the different programming languages follow the steps to install them in your machines:


### Post-installation

1.) The developer has to debug the program


2.) Update the path to the "log.txt" file in the **execute.py** file


3.) The program can be executed using the **execute.py** file which automatically creates a log file of the output and can be pushed to developer specific branches of the testing repo using the command `python3 execute.py`


4.) There are three test cases introduced of which all have to be passed in order for the program to successfully compile


5.) The base test case has to be passed in order further move on to Test Case 2 and Test Case 3


6.) The program may or may not contain syntax errors


7.) Every time the program is executed, time will be logged on the log.txt file


8.) The log.txt file is automatically updated on the github in the developer's branch each time the program is compiled





### Ruby

1.) Ruby execution Environment has to be setup by executing `sudo apt install ruby-full`. To install ruby on Mac use the command - brew install ruby


2.) Check for ruby version using the command `ruby --version`


3.) The bugs are introduced in the **game_of_life2** function.


4.) The developer has to find the bugs and debug them.


5.) Create an empty log file **log.txt** in the same directory where **execute.py** and **bug_fix_ruby.rb** is present if it does not exist.(Do this if the file is not present and you get error regarding this)


### Swift

Swift execution environment has to be set up as shown here https://medium.com/@gigmuster/install-swift-5-0-on-ubuntu-18-04-86f6b96654


The steps for setup are as follows:


-> `sudo apt-get install clang`


-> `sudo apt-get install libcurl4 libpython2.7 libpython2.7-dev`


-> `wget https://swift.org/builds/swift-5.0-release/ubuntu1804/swift-5.0-RELEASE/swift-5.0-RELEASE-ubuntu18.04.tar.gz`


-> `tar xzf swift-5.0-RELEASE-ubuntu18.04.tar.gz`


-> `sudo mv swift-5.0-RELEASE-ubuntu18.04 /usr/share/swift`


-> `echo "export PATH=/usr/share/swift/usr/bin:$PATH" >> ~/.bashrc`


-> `source  ~/.bashrc`


Check for swift version using the command `swift --version`


### Julia

1.) Julia environment can be set up as shown here https://ferrolho.github.io/blog/2019-01-26/how-to-install-julia-on-ubuntu


2.) The steps to be followed are as shown below:

-> `wget https://julialang-s3.julialang.org/bin/linux/x64/1.5/julia-1.5.0-linux-x86_64.tar.gz`


-> `tar -xvzf julia-1.5.0-linux-x86_64.tar.gz`


-> `sudo cp -r julia-1.5.0 /opt/`


-> `sudo ln -s /opt/julia-1.5.0/bin/julia /usr/local/bin/julia`


-> `julia`


-> `import Pkg; Pkg.add("Distributions")`


-> `exit()`

## Metric Evaluation of the Developers

1.) Every Developer's performance is analysed with respect to four major parameters


2.) The first parameter is with respect to the debugging time taken by the developer to complete the given task


3.) Here the task is considered to be completed if all the three test cases provided are passed successfully


4.) We request the developers to not run the program again if successfully completed


5.) The second parameter would be the Number of times the developer has compiled the code. The lesser the better


6.) The third parameter would be with respect to the responses given in the google forms


7.) The fourth major parameter would be the number of test cases passed. It is important that all test cases pass in order to get higher performance rating


8.) Please remember that this is solely for our analysis and should not be taken otherwise


## Performance Formula

**PF = 0.1(P+E) + 0.1(C+L) + (T*10)/((N/10)+(D/60))**
where

P -> No of Professional Experience in Years

E -> No of Experience in the particular language in Years

C -> Affinity towards Coding

L -> Affinity towards Logical Thinking and Problem Solving

T -> Number of Test Cases Passed

N -> Number of times the program was compiled

D -> Debugging time. If the task is failed, D = 30

## Repo used for Testing

https://github.com/bsharathramesh/HW2_SE2020_Testing

## METHODS USED FOR TESTING.

1.) We used following github repository for testing: https://github.com/bsharathramesh/HW2_SE2020_Testing

2.) Each individual testers were assigned with different github branches.

3.) Game of Life was coded in three different languages (ruby, Swift, Julia) and different bugs was introduced in each code.

4.) Each individual testers were given 30 mins to debug the code and get the expected outputs. 

5.) Initial setup required to run the test were mentioned in the README.md file and the test was performed in VCL machines or MAC laptops. 

6.) Each programming language code had three testcases. And the task for a particular code is consider successful when the tester is able to debug and all three testcases are passed. 

7.) To calculate the time taken by each tester to debug: End Time (Time when all three testcases passed) - start time ( time when the program was first compiled). This log is logged for each programming language and each tester will have their own log files. The log file is automatically checked into the testers github branch when the program is executed.

8.) Each tester were given option to start with any programming language and were given 30 mins to debug three programming language.

9.) Formula used for calculating the performance of each testers: 

**PF = 0.1(P+E) + 0.1(C+L) + (T*10)/((N/10)+(D/60))**
where

P -> No of Professional Experience in Years

E -> No of Experience in the particular language in Years

C -> Affinity towards Coding

L -> Affinity towards Logical Thinking and Problem Solving

T -> Number of Test Cases Passed

N -> Number of times the program was compiled

D -> Debugging time. If the task is failed, D = 30

## MATERIALS USED FOR TESTING

Game of Life was implemented in Julia, Ruby and Swift. Ten testers opted to debug the three bugs in each language implemented. A VCL had to be provisioned by the testers to carry out the debugging process. Julia, Swift and Ruby was installed using the steps provided in the README file. Each time the testers executed the program, the log file to record each time the program was executed and the number of test cases passed or failed was pushed to their respective branches on Github. All testers were asked to fill a questionnaire regarding their professional expertise and knowledge in the above programming languages to ascertain how comfortable they are in debugging the code and if it significantly affected the amount of time it took for them to debug the bugs.

