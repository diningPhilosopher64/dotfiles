
function repeat {
    num="${2:-100}"; printf -- "$1%.0s" $(seq 1 $num);
}

function print {
    terminalCols=$(tput cols)                                                   
    argLen=${#1}                                                                
    offset=$(((terminalCols-argLen)/2))                                         

    printf "\n"                                                                 
    repeat '#' $((offset-1))                                                    
    printf " $1 "                                                               
    repeat '#' $((offset-1))                                                    
    printf "\n" 
}

if [ -f ~/.bashrc ]; then
    print "Found file ~/.bashrc"
    #Rename current bash file with .bashrc.<current epoch time> 
    epoch_time=`date +"%Y-%m-%d %T"`
   
    print "Renaming ~/.bashrc to ~/.bashrc.$epoch_time"
    mv ~/.bashrc ~/.bashrc."$epoch_time"

    #Make a new hardlink 
    print "Updating hardlink for .bashrc"
    ln .bashrc ~/.bashrc 
fi



if [ -f ~/.vimrc ]; then
    print "Found file ~/.vimrc"
    #Rename current vimrc file with .vimrc.<current epoch time> 
    epoch_time=`date +"%Y-%m-%d %T"`
   
    print "Renaming ~/.vimrc to ~/.vimrc.$epoch_time"
    mv ~/.vimrc ~/.vimrc."$epoch_time"

    #Make a new hardlink 
    print "Updating hardlink for .vimrc"
    ln .vimrc ~/.vimrc 
fi
