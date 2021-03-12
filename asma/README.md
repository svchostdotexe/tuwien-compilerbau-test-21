# ASMA Testcase generator
To generate the testcases you simply have to run the script `testgenerator.sh`.

## Adding more testcases
If you want to add more testcases created a new file in `testcases` and add your test method. The method the programm hast to call to perform the test to return an int. This int represents the number of testcases that failed!
The first line of the file has to be the method definition. As an example you can look at the example testcase in the file `./testcases/example-testcase.c`