## Methods used for Testing

- We used following github repository for testing: https://github.com/bsharathramesh/HW2_SE2020_Testing

- Each individual testers were assigned with different github branches.

- Game of Life was coded in three different languages (ruby, Swift, Julia) and different bugs was introduced in each code.

- Each individual testers were given 30 mins to debug the code and get the expected outputs. 

- Initial setup required to run the test were mentioned in the README.md file and the test was performed in VCL machines or MAC laptops. 

- Each programming language code had three testcases. And the task for a particular code is consider successful when the tester is able to debug and all three testcases are passed. 

- To calculate the time taken by each tester to debug: End Time (Time when all three testcases passed) - start time ( time when the program was first compiled). This log is logged for each programming language and each tester will have their own log files. The log file is automatically checked into the testers github branch when the program is executed.

- Each tester were given option to start with any programming language and were given 30 mins to debug three programming language.

- Formula used for calculating the performance of each testers: 

**PF = 0.1(P+E) + 0.1(C+L) + (T*10)/((N/10)+(D/60))**
where

P -> No of Professional Experience in Years

E -> No of Experience in the particular language in Years

C -> Affinity towards Coding

L -> Affinity towards Logical Thinking and Problem Solving

T -> Number of Test Cases Passed

N -> Number of times the program was compiled

D -> Debugging time. If the task is failed, D = 30

## Materials Used for Testing

- Game of Life was implemented in Julia, Ruby and Swift. Ten testers opted to debug the three bugs in each language implemented. A VCL had to be provisioned by the testers to carry out the debugging process. 

- Julia, Swift and Ruby was installed using the steps provided in the README file. Each time the testers executed the program, the log file to record each time the program was executed and the number of test cases passed or failed was pushed to their respective branches on Github. 

- All testers were asked to fill a questionnaire regarding their professional expertise and knowledge in the above programming languages to ascertain how comfortable they are in debugging the code and if it significantly affected the amount of time it took for them to debug the bugs.

## Observations
- Most testers were not familiar with Julia, Ruby and Swift.

- Testers preferred to debug Ruby code first followed by Julia and Swift.

- It was observed that the testers who had more affinity towards coding and logical thinking were able to solve the given problem much faster than the inexperienced.

- It was also observed that professional experience didn’t contribute much to the efficiency of solving the problem.

- They could solve the problem with an average of 10% faster accuracy.

- On an average it was seen that at every 1.5 mins, a compilation was done in the program which showed that testers were keen on getting the solution rather than solving the problem.

- We also had some outliers, who solved the problem with lesser code compilations.

- Statistical values of debug experiment can be found in https://github.com/bsharathramesh/HW2_SoftwareEngineering/blob/master/Evaluation.xlsx

### Pie Chart Observation

![Screen Shot 2020-09-02 at 12 05 07 AM](https://user-images.githubusercontent.com/55364746/91931088-7cc66f00-ecb0-11ea-8c70-097be9425b9e.png)

![Screen Shot 2020-09-02 at 12 05 52 AM](https://user-images.githubusercontent.com/55364746/91931091-7f28c900-ecb0-11ea-8d99-588f83fdd77b.png)

![Screen Shot 2020-09-02 at 12 06 15 AM](https://user-images.githubusercontent.com/55364746/91931097-818b2300-ecb0-11ea-9d16-8c69adaba214.png)

![Screen Shot 2020-09-02 at 12 06 39 AM](https://user-images.githubusercontent.com/55364746/91931105-87810400-ecb0-11ea-869c-69ad7cbe01c9.png)

![Screen Shot 2020-09-02 at 12 07 00 AM](https://user-images.githubusercontent.com/55364746/91931115-8cde4e80-ecb0-11ea-81de-b592d145b273.png)

![Screen Shot 2020-09-02 at 12 07 24 AM](https://user-images.githubusercontent.com/55364746/91931121-91a30280-ecb0-11ea-95fc-f33c55dbbfa0.png)

![Screen Shot 2020-09-02 at 12 07 54 AM](https://user-images.githubusercontent.com/55364746/91931128-95368980-ecb0-11ea-9a79-031edac5c761.png)


## Conclusion
- The testers tend to take less time to debug the second and the third language than the first.

- It was seen that testers with math solving and logical thinking capability had a better advantage than the others.

## Threats to Validity

- Glitches in data collection due to ad hoc threats i.e the issue could present itself under a different name or category. Ex: Bad Internet connections, package version compatibility. To alleviate this, we could extensively come up with possible adhoc scenarios which we can preemptively address.

- Minor hindrance to testing because the latest code was not available to test subjects (Due to github branch update issues). This issue was quickly resolved. In future projects, more emphasis will be given to ensure that the test subjects get to test the right software.

- Insufficient data collection because test subjects forgot to provide their valuable inputs even after their agreement to do so. Even though this is an adhoc threat, we can always politely request the test subject to provide their valuable inputs and suggestions.

- One major threat to validity is lack of diversity in test subjects. Most of our test subjects were freshers, therefore our analysis was biased towards freshers and we did not infer much information about people with experience. This was not in our control as test subjects were volunteers. To address this, we can create focus groups and have people volunteer for the focus group provided they meet the constraint of that group.
