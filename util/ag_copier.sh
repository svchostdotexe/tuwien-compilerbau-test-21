#!/bin/bash

COPYFOLDER="invalid"

# Only run this command in the ag folder.
if [[ "$PWD" == *ag ]] 
then 
    echo "[✅] Exectuing the command in the right folder!";
else 
    echo "[❌] You have to run the command in the ag folder...";
    exit 1;
fi

if [[ "$1" == codea ]] 
then
    COPYFOLDER="codea"
elif [[ "$1" == codeb ]] 
then
    COPYFOLDER="codeb"
else
    echo "[❌] You need to specify if you want to copy to codea or codeb...";
    exit 1;
fi  



for file in *; do   
    
    if [[ $file == *\.3 ]] # * is used for pattern matching
    then
        echo "[✅] Copying $file to ../${COPYFOLDER}/ag_test_case_${file}";
        cp "$file" "../${COPYFOLDER}/ag_test_case_${file}"; 
    fi
    
done