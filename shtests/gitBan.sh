#!/bin/bash

board_stages=(ck code cr qa dr )

findNewBranches(){
	local retVal="`echo "$1" | grep new | awk '{print $4}'`"
	if [[ -n "$retVal" ]]
	then
	echo $retVal
	else
	echo "No.New.Branches"
	fi
}

findCodeReviewBranches() {
	local stuff=( "$@" )
	for i in "${stuff[@]}";
		do
		local has_code_review=`echo "$i" | grep .cr$`
		if [[ -n "$has_code_review" ]]
		then
			code_reviews=$has_code_review
		fi;
	done;
	echo $code_reviews		
}


findDesignReviewBranches() {
	local stuff=( "$@" )
	for i in "${stuff[@]}";
		do
	    local has_design_review=`echo "$i" | grep .dr$`
		if [[ -n "$has_design_review" ]]
		then
			has_design_review=$has_design_review
		fi;
	done;
	echo $has_design_review		
}

findQABranches() {
	local stuff=( "$@" )
	for i in "${stuff[@]}";
		do
		echo $i
		local has_qa_review=`echo "$i" | grep .qa$`
		if [[ -n "$has_qa_review" ]]
		then
			has_qa_review=$has_qa_review
		fi;
	done;
	echo $has_qa_review		
}

findBranchByExtension()
{
#idea for refactoring
#have function call a delegate function based on the extension of the branch name
#so lisp.cr ada.qa 3333.dr would find 'dr' in it's global maps variable
#then call dr(parms[1..arg.length]
	local ext=$1
	local parms=( "$@" )
	result="notcalled"
	for (( i = 1 ; i < "${#@}" ; i++ ))
	do
		if grep -q $ext <<<${parms[$i]}; then
			result="`$ext ${parms[$i]}`"
		fi
	done	
	echo $result
}


dr() {
	echo $"dr() called with $@"
}
