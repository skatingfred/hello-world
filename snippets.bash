#!/bin/bash
exit








#################################################
echo "# SHELL TIME EXECUTION"
#################################################
SHELL_BEGIN=$(date +%s)
echo "... script ... "
SHELL_END=$(date +%s)
SHELL_TIME=$((SHELL_END-SHELL_BEGIN))
echo "### SHELL_TIME: $(( SHELL_END - SHELL_BEGIN )) secondes ### "



#################################################
echo "# READ AND COMMENT A FILE LINE BY LINE"
#################################################
INPUT_FILE="some.file.txt"
LINES_COUNT=$(cat "$INPUT_FILE"|wc -l)
LINE_INCR=1
while read -r LINE_CONTENT <&3
do

  if [[ ! "$LINE_CONTENT" =~ ^# ]]; then

  echo "## LINE N° $LINE_INCR/$LINES_COUNT"  
  echo "$LINE_CONTENT"
  sleep 1

  sed -i "${LINE_INCR}s|^|#|" "$INPUT_FILE"
  fi

((LINE_INCR++))
done 3<"$INPUT_FILE"










