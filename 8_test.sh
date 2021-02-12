a=foo
b=bar
if [[ $a == $b ]]     # this is legit
then 
    echo true
else
    echo false
fi 