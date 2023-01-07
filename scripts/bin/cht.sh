languages=`echo "golang lua python cpp c typescript nodejs reactjs" | tr ' ' '\n'`

selected=`printf "$languages\n" | fzf`
read -p "query => " query

curl cht.sh/$selected/`echo $query | tr ' ' '+'` & while [ : ]; do sleep 1; done
