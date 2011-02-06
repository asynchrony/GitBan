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

nextStep() {
	stuff=( "$@" )
	code_reviews=''
	counter=0
	for i in "${stuff[@]}";
		do
		has_code_review=`echo "$i" | grep cr`
		if [[ -n "$has_code_review" ]]
		then
			code_reviews=$has_code_review
		fi;
	done;
	echo $code_reviews		
}

