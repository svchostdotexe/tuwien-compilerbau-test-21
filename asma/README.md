# ASMA Testcase generator
> Created by KingD

To generate the testcases you simply have to run the script `testgenerator.sh`. After the script is finished it will create a file called `main.c`. Simply copy that file and paste it where your `amsa.o` `Makefile` etc is and run `/usr/ftp/pub/ubvl/test/asma/test`. Have fun!

## Adding more testcases
If you want to add more testcases created a new file in `testcases` and add your test method. The method the programm hast to call to perform the test to return an int. This int represents the number of testcases that failed!
The first line of the file has to be the method definition. As an example you can look at the example testcase in the file `./testcases/example-testcase.c`
