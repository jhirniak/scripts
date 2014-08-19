#!/bin/bash

source data.sh
source fun.sh

passed=0
failed=0
total=0

for (( fi=0; fi<$funN; fi++ )); do
  funPath=f$fi
  fun=`"$funPath"`

  for (( di=0; di<$dataN; di++ )); do
    data=d$di[@]
    expected=e$di[@]
    data=${!data}
    expected=${!expected}

    echo ${data[@]}

    res=`$fun $data`

    echo "****************************"
    testNum=$((fi*fNum + di))
    echo "Test $testNum (fun: $fi, data: $di):"
    echo "  Result: ${res[@]}"
    echo "Expected: ${expected[@]}"
    if [ "$res[@]" = "$expected[@]" ]; then
      echo "Passed!"
      ((passed++))
    else
      echo "Failed!"
      ((failed++))
    fi
    ((total++))
  done
done

echo "****************************"
echo "Finished testing."
echo "Passed: ${passed}/${total} ($((100 * $passed / $total))%)"
echo "Failed: ${failed}/${total} ($((100 * $failed / $total))%)"
