#!/bin/bash

while true; do
	SOURCE=${BASH_SOURCE[0]}
	DIR=`dirname $SOURCE`
	$DIR/now-playing.sh
done

