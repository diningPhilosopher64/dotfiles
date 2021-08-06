
function repeat {
    bash repeat.sh "$1" "$2"
}


terminalCols=$(tput cols)                                                   
argLen=${#1}                                                                
offset=$(((terminalCols-argLen)/2))                                         

printf "\n"                                                                 
repeat '#' $((offset-1))                                                    
printf " $1 "                                                               
repeat '#' $((offset-1))                                                    
printf "\n"                                                                 

 
 # Semifunctional alternate approach                                         
 #printf '\n%*s\n' "${COLUMNS:-$(tput cols)}" '' | tr ' ' -                  
 #printf "%-${offset}s $1\n" "#"                                             
 #printf '%*s\n' "${COLUMNS:-$(tput cols)}" '' | tr ' ' -    
