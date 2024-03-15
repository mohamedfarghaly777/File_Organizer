#!/bin/bash

function get_Destination()
{
    declare tempname=""
    declare file=$1
    file=$(basename "$file")

    if [[ ${file:0:1} == "." ]]; then
        tempname=${file:1}
    else
        tempname=$file
    fi
    dist=${tempname##*.}
    if [[ "$dist" == "$tempname" ]]; then
        dist="misc"
    fi
    echo $dist
}

function create_dir()
{
    declare dist=$1
    echo $dist
    if [[ ! -d $dist ]]; then
        mkdir $dist
    fi 
}

function main()
{
    # Variables
    declare dir=$1
    declare dist=""

    cd $dir
    # Searching in the current directory
    for file in `find $dir -maxdepth 1 -type f -ls | awk '{ print  $11 $12 }'`; do
    dist=`get_Destination $file`
    create_dir $dist
    mv $file  $dist
    done
}
 main $1