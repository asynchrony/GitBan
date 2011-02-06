#!/bin/bash

findNewBranches() {
	retVal="`echo "$1" | grep new | awk '{print $4}'`"
	if [[ -n "$retVal" ]]
	then
	echo $retVal
	else
	echo "No.New.Branches"
	fi
}
