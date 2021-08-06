
function print {
    bash print.sh "$1" "$2"
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
