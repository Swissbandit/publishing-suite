#!/bin/bash
# This script is utilized for mapping failures from the 'qdn-fail' folder's 'log.txt'. This script is for QBrighteon published files only. Its name should be 'map-qdn-failures-QBrighteon.sh'.

echo "-----grabbing python script for mapping qdn-fail log, making executable, and placing in correct location..."
wget https://raw.githubusercontent.com/crowetic/publishing-suite/main/QBrighteon/map-qdn-fail.py 
chmod +x map-qdn-fail.py
mv map-qdn-fail.py publish-failed/qdn-fail/

# check for existing instructions so we don't duplicate them...
if [[ -f "QDN-FAIL-INSTRUCTIONS.txt" ]]; then
    instructions_existing=1
fi

echo "-----executing map-qdn-fail.py to create 'output.txt' in qdn-fail folder..."

cd publish-failed/qdn-fail
python3 map-qdn-fail.py
cd ../..

echo "-----created 'output.txt' for 'already-mapped-full-republish.sh' script. You can now execute the 'already-mapped-full-republish.sh' script from channel directory, and it will publish the failed files again utilizing the existing full_identifier, remember to pass the correct inputs to the already-mapped script EXAMPLE: './already-mapped-full-republish -b -i bteon_vid' - this example will publish utilizing the 'bad-publish-mapping' method (script will automatically take care of renaming the output.txt from python script) and execute the call with the 'initial_identifier' of 'bteon_vid' (which is what all QBrighteon publishing uses for primary identifier."

echo "-----sleeping for 10 seconds to give enough time to read the above information... and creating 'QDN-FAIL-INSTRUCTIONS.txt' (if they don't already exist) explaining what to do."
sleep 10

if [[ ${instructions_existing} == 1 ]]; then
     exit 1
else 

    echo "-----to fix failed qdn publish from the 'publish-failed/qdn-fail' failures-----" >> "QDN-FAIL-INSTRUCTIONS.txt"
    echo "     -----     " >> "QDN-FAIL-INSTRUCTIONS.txt"
    echo "This script was step 1. This script will create the 'output.txt' file from the 'map-qdn-fail.py' python script" >> "QDN-FAIL-INSTRUCTIONS.txt"
    echo "     -----     " >> "QDN-FAIL-INSTRUCTIONS.txt"
    echo "Once you have run this script, you will have the necessary files in the necessary locations" >> "QDN-FAIL-INSTRUCTIONS.txt"
    echo "     -----     " >> "QDN-FAIL-INSTRUCTIONS.txt"
    echo "This script, along with all the other 'primary' scripts of the publishing suite, is located in the 'channel' directory." >> "QDN-FAIL-INSTRUCTIONS.txt"
    echo "     -----     " >> "QDN-FAIL-INSTRUCTIONS.txt"
    echo "Each channel being published to QBrighteon has its own folder, with a unique version of the overall 'publish-videos-qdn.sh' script containing privkey." >> "QDN-FAIL-INSTRUCTIONS.txt"
    echo "     -----     " >> "QDN-FAIL-INSTRUCTIONS.txt"
    echo "Each channel contains also the other scripts utilized to fix various publishing errors." >> "QDN-FAIL-INSTRUCTIONS.txt"
    echo "     -----     " >> "QDN-FAIL-INSTRUCTIONS.txt"
    echo "Most of these errors should no longer happen, as they are handled correctly now in the publish scripts." >> "QDN-FAIL-INSTRUCTIONS.txt"
    echo "     -----     " >> "QDN-FAIL-INSTRUCTIONS.txt"
    echo "However, there ARE still cases where for whatever reason, the 'qdn' script doesn't publish correctly, this is where the 'fix' scripts come in" >> "QDN-FAIL-INSTRUCTIONS.txt"
    echo "     -----     " >> "QDN-FAIL-INSTRUCTIONS.txt"
    echo "In this case, since you have run this script 'fix-qdn-failures-QBrighteon.sh', it is assumed that you have had a qdn failure while publishing to QBrighteon" >> "QDN-FAIL-INSTRUCTIONS.txt"
    echo "     -----     " >> "QDN-FAIL-INSTRUCTIONS.txt"
    echo "This script has already created the 'mapping' files that are required in order to re-publish the failed attempts utilizing the SAME IDENTIFIER" >> "QDN-FAIL-INSTRUCTIONS.txt"
    echo "     -----     " >> "QDN-FAIL-INSTRUCTIONS.txt"
    echo "If you attempt to re-publish without doing this mapping, you will DOUBLE-PUBLISH, and we want to avoid doing that." >> "QDN-FAIL-INSTRUCTIONS.txt"
    echo "     -----     " >> "QDN-FAIL-INSTRUCTIONS.txt"
    echo "AFTER running this script, you will need to run the 'already-mapped-full-republish.sh' script, which will handle the re-publishing for you" >> "QDN-FAIL-INSTRUCTIONS.txt"
    echo "     -----     " >> "QDN-FAIL-INSTRUCTIONS.txt"
    echo "The already-mapped script contains a few inputs that you need to pass it in order for it to function." >> "QDN-FAIL-INSTRUCTIONS.txt"
    echo "     -----     " >> "QDN-FAIL-INSTRUCTIONS.txt"
    echo "Those variables are '-b' or '-a' for 'bad-publish-mapping' or 'asterisk failures'" >> "QDN-FAIL-INSTRUCTIONS.txt"
    echo "(NOTE - asterisk failures should not happen anymore due to improved scripts, but retaining ability to fix them if needed.)" >> "QDN-FAIL-INSTRUCTIONS.txt"
    echo " bad-mapping is for fixing publishing on files based on the output of various other fix scripts. In the case of this script, we will be using '-b' for 'bad-mapping' fix." >> "QDN-FAIL-INSTRUCTIONS.txt"
    echo "     -----     " >> "QDN-FAIL-INSTRUCTIONS.txt"
    echo "The NEXT STEP for you to FULLY RE-PUBLISH is to run the 'already-mapped-full-republish.sh' script like this './already-mapped-full-republish.sh -b -i bteon_vid'" >> "QDN-FAIL-INSTRUCTIONS.txt"
    echo "NOTE - we are passing '-i bteon_vid' because the initial identifier is 'bteon_vid' for QBrighteon." >> "QDN-FAIL-INSTRUCTIONS.txt"
    echo "(the -t option is for re-publishing on Qortal TESTNET, everything else remains the same." >> "QDN-FAIL-INSTRUCTIONS.txt"
    echo "     -----     -----     -----     -----     -----     -----" >> "QDN-FAIL-INSTRUCTIONS.txt"
    echo "     -----     " >> "QDN-FAIL-INSTRUCTIONS.txt"
    echo "     -----     " >> "QDN-FAIL-INSTRUCTIONS.txt"
    echo "     -----     -----     -----     -----     -----     -----" >> "QDN-FAIL-INSTRUCTIONS.txt"
    echo "Once you have run './already-mapped-full-republish.sh -b -i bteon_vid' the rest should be taken care of automatically, and your files should be republished correctly." >> "QDN-FAIL-INSTRUCTIONS.txt"

fi







