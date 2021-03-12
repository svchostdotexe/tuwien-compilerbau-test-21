#! /bin/bash

TEST_METHOD_PATTERN="int .+\(\)"
TEMPLATE_MAIN="./template_main.c"

# this file generates the custom test script for student written tests
# all the test included in the folder ./testcases will be included
TESTMETHOD_CODE=""
FUNCTIONCALL_CODE=""
FUNCTIONCOUNTER=0
GENERATED_CODE=""

TESTCASE_DIR="./testcases"
if [ -d "$TESTCASE_DIR" ]; then
    # Take action if $DIR exists. #
    echo "[✅] Testcase dir is here ${TESTCASE_DIR}"
else
    echo "[❌] We have a problem ${TESTCASE_DIR} not existing!!"
    exit 1
fi

for file in $(ls $TESTCASE_DIR)
do
    fileName="$TESTCASE_DIR/$file"
    echo "[🍻] Processing ${fileName}"

    line=$(head -n 1 $fileName)

    if [[ $line =~ $pat ]]; then
        echo "[✅] Testcase ${fileName} has the correct format!"
    else
        echo "[❌] Testcase ${fileName} has not the correct format! Please check that the first line only contains the return type and the method name without params like that 'int XXX()'"
        exit 1
    fi

    echo "[🍻] Reading the content of ${fileName}"
    TESTMETHOD_CODE+="$(cat $fileName)"

    echo "[🍻] Generating the function call for ${fileName}"
    FUNCTIONCOUNTER=$((FUNCTIONCOUNTER+1))

    arrIN=(${line// / })
    FUNCTIONCALL_CODE+="int errorsTestCase${FUNCTIONCOUNTER} = ${arrIN[1]}; 
    if(errorsTestCase${FUNCTIONCOUNTER} == 0) { 
        fprintf(stdout, \"\n[✅] Testcase ${arrIN[1]} succeeded.\n\"); 
    } else { 
        fprintf(stdout, \"\n[❌] Testcase ${arrIN[1]} failed! Number of tests failed: %d.\n\",errorsTestCase${FUNCTIONCOUNTER}); 
    }"

    echo "[✅] Function call for ${fileName} generated successfully!"
done

echo "[🍻] Reading the template for the main.c ${TEMPLATE_MAIN}"
if test -f "$TEMPLATE_MAIN"; then
    echo "[✅] $TEMPLATE_MAIN exists."
else 
    echo "[❌] $TEMPLATE_MAIN doest not exists."
    exit 1
fi
TEMPLATE_MAIN_CONTENT="$(cat ${TEMPLATE_MAIN})"
#echo "$TEMPLATE_MAIN_CONTENT"

echo "[🍻] Generating the main.c from all the testcases based on the file ${TEMPLATE_MAIN}"
GENERATED_CODE+="${TEMPLATE_MAIN_CONTENT/METHODE_CODE/$TESTMETHOD_CODE}"
GENERATED_CODE="${GENERATED_CODE/METHODE_CALL_HERE/$FUNCTIONCALL_CODE}"

echo "$GENERATED_CODE" > main.c
echo "[✅] main.c successfully generated"
echo "[ℹ️ ] To run the test now simple copy the generated main.c (dont change the name) and paste it in your working directory. For example into '~/abgabe/asma' and run '/usr/ftp/pub/ubvl/test/asma/test'"