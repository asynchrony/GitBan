#!/bin/bash

findNewBranches() {
	echo "`echo "$1" | grep new | awk '{print $4}'`"
}
