#!/bin/bash

# Only run this command in the ag folder.

if [[ "$PWD" == *ag ]] 
then 
    echo "[✅] Exectuing the command in the right folder!";
else 
    echo "[❌] You have to run the command in the ag folder...";
    exit 1;
fi


for file in *; do   
    
    if [[ $file == *\.3 ]] # * is used for pattern matching
    then
        echo "[✅] Copying $file to ../codeb/ag_test_case_${file}";
        cp "$file" "../codeb/ag_test_case_${file}"; 
    fi
    
done