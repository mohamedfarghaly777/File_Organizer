declare dir=$1
declare tempname=""
declare basename=""
declare extension=""
declare dist=""

cd $dir

# Searching in the current directory
for file in `find $dir -maxdepth 1 -type f -ls | awk '{ print  $11 $12 }'`; do

   file=$(basename "$file")

    if [[ ${file:0:1} == "." ]]; then
        tempname=${file:1}
        echo "Hidden File $file"
    else
        tempname=$file
    fi
    dist=${tempname##*.}
    if [[ "$dist" == "$tempname" ]]; then
        dist="misc"
    fi

    if [[ ! -d $dist ]]; then
        mkdir $dist
    fi 
    mv $file  $dist
done
