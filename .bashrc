# -*-shell-script-*-
# For information and guidelines on what should and should NOT go
# in here, please read sbsetupunix help:
#   http://inside.mathworks.com/wiki/SBTools#sbsetupunix
# In particular pay attention to the 'Typical Mistakes' that can cause
# significant pain to the company.
# You should also time your changes as explained in sbsetupunix help.

#. /mathworks/hub/share/sbtools/bash_setup.bash 
#. /mathworks/hub/share/sbtools/bash_setup.bash || echo "Did not find bash_setup.bash. Continuing as usual."

if [ -f "/mathworks/hub/share/sbtools/bash_setup.bash" ]; then
    # run if file exists. 
    . /mathworks/hub/share/sbtools/bash_setup.bash 
fi


# You can use sbimerge to handle merging indented with unindented code, by uncommenting:
#  export P4MERGE=sbimerge

# Uncomment following to use emacs via 'emacsclient' as the editor for Perforce
#   export EDITOR='sbe -w'
#   export VISUAL='sbe -w'
#   export P4EDITOR='sbe -w'
#   export P4DIFF='sbe -sb-diff'
#   export P4MERGE='sbimerge -p4merge="sbe -sb-merge"'
# Emacsclient (sbe) is a capability where an existing emacs session is reused. If you
# want to always use a new emacs session, replace sbe with emacs.
#
# You can also use gvim as the Perforce editor via:
#   export P4EDITOR='gvim -f'

# Uncomment following for Perforce, p4, command colors which works well in light and dark terminals
#   export P4COLORS="@info=0:@error=31;1:@warning=35;1:action=36;1:how:36:change=34:depotFile=32:path=32:location=32:rev=31:depotRev=31"
# An alternative for dark-only terminals:
#   export P4COLORS="@info=0:@error=31;1:@warning=35;1:action=36;1:how:36:change=33:depotFile=32:path=32:location=32:rev=31:depotRev=31"

# If you want to further customize your bash configuration, uncomment the lines
# below, and create ~/.bashrc.mine
#  if [ -f "$HOME/.bashrc.mine" ] ; then
#      . "$HOME/.bashrc.mine"
#  fi

# LocalWords:  emacsclient gvim

#parse_git_branch() {
##     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ \1/'
#}
#
#
#if [ "$color_prompt" = yes ]; then
#       PS1='$(parse_git_branch) \[\033[00m\]${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\][\W]\[\033[01;31m\]$ '
#else
#       PS1='$(parse_git_branch) ${debian_chroot:+($debian_chroot)}\u@\h:[\W]\$ '
#fi
#


########################################################################################################

#                                               My Stuff

########################################################################################################

# enable color support of ls and also add handy aliases                         
if [ -x /usr/bin/dircolors ]; then                                              
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'                                                  
    #alias dir='dir --color=auto'                                               
    #alias vdir='vdir --color=auto'                                             

    alias grep='grep --color=auto'                                              
    alias fgrep='fgrep --color=auto'                                            
    alias egrep='egrep --color=auto'                                            
fi  

# enable programmable completion features (you don't need to enable             
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile            
# sources /etc/bash.bashrc).                                                    
if ! shopt -oq posix; then                                                      
  if [ -f /usr/share/bash-completion/bash_completion ]; then                    
    . /usr/share/bash-completion/bash_completion                                
  elif [ -f /etc/bash_completion ]; then                                        
    . /etc/bash_completion                                                      
  fi                                                                            
fi  

# params passed can be aliases with the below cmd.
                                                                                
shopt -s cdable_vars                                                            
export projects=/sandbox/skondapa/Projects/fte                                  
export starship=~/.config/starship.toml   

##########################Byobu##########################

alias 'b'='byobu'
alias 'bls'='byobu list-session'
alias 'bks'='byobu kill-session -t'


##########################.bashrc##########################
function openf {                                                                
                                                                                
    if [ "$1" = "brc" ]                                                         
    then                                                                        
        vim ~/.bashrc                                                           
                                                                                
    elif [ "$1" = "i3" ]                                                        
    then                                                                        
        vim ~/.config/i3/config                                                 
                                                                                
    elif [ "$1" = "vrc" ]                                                       
    then                                                                        
        vim ~/.vimrc                                                            
                                                                                
    else                                                                        
        echo "Unknown param: $1"                                                
    fi                                                                          
}   

#reload/source bashrc
alias 'sourcerc'='source ~/.bashrc'

# get process id from port
function getpid-port {
     lsof -n -i :$1
}

function repeat { 
    num="${2:-100}"; printf -- "$1%.0s" $(seq 1 $num); 
}
# custom print function for pretty printing aliases/ functions
function print {
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
}

########################### general ##########################  

function mkcd {
    mkdir "$1"
    cd "$1"
}

alias 'goto'='cd'
alias 'open'='nautilus'
alias 'install'='sudo apt install -y'
alias 'remove'='sudo apt remove -y'
alias 'open_p'='pcmanfm -d projects & exit'
alias 'i'='install'

function kill_process {                                                         
    if [ -z "$1" ]                                                              
    then                                                                        
       print "Pass a process name as a parameter"
    else                                                                        
       pgrep "$1" | xargs kill -9                                               
    fi                                                                          
}                                                                               
                                                                                
alias 'killp'='kill_process'                                                    
alias 'killProcess'='kill_process'  


###########################python/pip##########################  
alias 'pi'='pip install'
alias 'pirm'='pip uninstall -y'
alias 'py'='python'
alias 'sdist'='rm -rf dist/ ; py setup.py sdist ; pip install dist/*'

# Create new venv using python3
# If no name is passed will default to .venv
function mkvenv {
    if [ -z "$1" ]
    then
        #echo -e "\n####### Creating virtualenv: .venv #######\n"
        print "Creating virtualenv: .venv"
        python3 -m venv .venv
        avenv
    else
        print "Creating virtualenv: $1"
        python3 -m venv "$1"
        avenv "$1"
    fi

    #echo -e "\n####### Upgrading pip #######\n"
    print "Upgrading pip"
    pip install pip --upgrade

    #echo -e "\n####### Installing wheel package #######\n"
    print "Installing wheel package"
    pip install wheel
    #echo -e "\n####### Activated virtualenv #######\n"
    print "Activated virtualenv"
}

alias 'mkenv'='mkvenv'

# Remove a virtual env.
# If no name is passed will default to .venv
function rmvenv {
    if [ -z "$1" ]
    then
        #echo -e "\n####### Removing virtual env: .venv #######\n"
        print "Removing virtualenv: .venv"
        python3 -m venv .venv
        rm -rf .venv
    else
        print "Removing virtualenv: $1"
        rm -rf "$1"
    fi
}

alias 'rmenv'='rmvenv'

# Activate virtual env
# If no name is passed will default to .venv
function avenv {

    if [ -z "$1" ]
    then
        #echo -e "\n####### Activating virtualenv: .venv #######\n"
        print "Activating virtualenv: .venv" 
        source .venv/bin/activate || echo "Failed to activate virtualenv: .venv"  
    else
        #echo -e "\n####### Activating virtualenv: $1 #######\n"
        print "Activating virtualenv: $1" 
        source "$1"/bin/activate  || echo "Failed to activate virtualenv: $1"
    fi
}

alias 'aenv'='avenv'

# Deactivate virtual env

function dvenv {

    if [ -z "$1" ]
    then
    echo -e "\n####### Deactivating virtualenv: .venv #######\n"
        deactivate || echo "Failed to deactivate virtualenv: .venv"  
    else
    echo -e "\n####### Deactivating virtualenv: $1 #######\n"
        deactivate "$1" || echo "Failed to deactivate virtualenv: $1"  
    fi
}
alias 'denv'='dvenv'

##########################git##########################

#git aliases
alias 'gs'='git status'
alias 'glo'='git log --oneline'
alias 'gl'='git log'
alias 'gc'='git commit -m'
#alias 'ga'='git add'
alias 'gb'='git branch'
alias 'gba'='git branch -a'
alias 'gbv'='git branch -v'
alias 'gbav'='git branch -av'
alias 'gcb'='git checkout'
alias 'gsl'='git stash list'
alias 'gsp'='git stash push -m'
alias 'glsremote'='git remote -v'

function gaddremote {
        git remote add "$1" "$2"
}

function grenameremote {
    git remote rename "$1" "$2"
}

function ga {

    if [ -z "$1" ]
    then
       git add . 
    else
        git add
    fi
}

function gfmr {
    default_repo="https://insidelabs-git.mathworks.com/cit/mathworks/jupyter-matlab-proxy.git "
    echo -e "\n####### Cloning default repo #######\n"
    git clone $default_repo . || echo -e "Failed to clone repo" 
    echo -e "\n####### Fetching merge-request #######\n"
    git fetch origin merge-requests/"$1"/head:"$2" || echo -e "Failed to fetch branch $2 of merge-request $1"
}

function gfmrip {
    gfmr "$1" "$2"
    mkvenv
    avenv
    echo -e "\n####### Installing dependencies #######\n"
    pip install -e .[DEV]
    echo -e "\n####### Checking out to branch $2 #######\n"
    git checkout "$2"
}

if [ -f ~/.git-completion.bash ]; then
  . ~/.git-completion.bash
  __git_complete g __git_main
  __git_complete gc _git_checkout
  #__git_complete gm __git_merge
  __git_complete gp _git_pull

fi

##########################Starship##########################
eval "$(starship init bash)"


##########################Conda########################## 


#  MAMBA:Currently, only install, create, list, search, run, info and clean are supported through mamba.


#create new venv
function cmkvenv(){
   mkdir -p /usr/softwares/miniconda3/envs/"$1"
#  mamba create -n "$1" --prefix=/usr/softwares/miniconda3/envs/"$1" python="$2" -y
  conda create  --prefix=/usr/softwares/miniconda3/envs/"$1" python="$2" -y
}
alias 'cmkenv'='cmkvenv'

#remove a venv
function crmvenv(){
  mamba env remove -n "$1"
}

alias 'crmenv'='crmvenv'

#list envs
alias 'clsenv'='mamba env list'
alias 'clsvenv'='mamba env list'

# list packages in an env
function clspkg {

    if [ -z "$1" ]
    then
        # Will list packages in base env
        conda list
    else
        # Will list packages in a specific env
        conda list -n "$1"
    fi
}

#activate venv.
#Can't use mamba for activation and deactivation of env
function caenv {
  conda activate "$1"
}

#deactivate venv
alias "cdvenv"="conda deactivate"
alias "cdenv"="conda deactivate"

#add channels in conda
function caddc {
    if [ -z "$1" ]
    then
        echo "Provide a channel name to add!"
        #exit 1;
    else
        mamba config --add channels "$1"
    fi
}

#Conda install a package
function cip {
    if [ -z "$2" ]
    then
        /usr/softwares/miniconda3/condabin/mamba install -y "$1"
    else
         /usr/softwares/miniconda3/condabin/mamba install -c "$2" "$1"
    fi
}

#Conda remove a package
alias 'crmp'='mamba uninstall -y'

#list channels in conda
function clsc {
  conda config --show channels
}

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/usr/softwares/miniconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/usr/softwares/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/usr/softwares/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/usr/softwares/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<


########################## node ########################## 
alias 'ns'='echo "running command: HOST=localhost npm start" HOST=localhost npm start'


# Install packages(s)
function ni {
    if [ -z "$1" ]
    then
        print "Installing packages from package.json"
        npm install
    else
        npm install "$1"
    fi
}


########################## docker ########################## 
alias 'dps'='docker ps'
alias 'dpsa'='docker ps -a'
alias 'd'='docker'


# "Private" generic function which is used in the below functions
function __dex  {
    docker exec -it "$1" "$2"
}

# Attach a bash shell to a running docker container
function dexb {
    __dex "$1" /bin/bash
}

# Attach a sh shell to a running docker container
function dexs {
    __dex "$1" sh
}

# Making default shell as bash when attaching to a running docker container
alias 'dex'='dexb'

# Remove arbitrary number of  docker containers
function dcrm {
    docker container rm "$@"
}

# Force remove arbitrary number of docker containers
function dcrmf {
    docker container rm -f "$@"
}



########################## Serverless Framework ########################## 

#serverless tab complete                                                        
# tabtab source for packages                                                    
# uninstall by removing these lines                                             
[ -f ~/.config/tabtab/__tabtab.bash ] && . ~/.config/tabtab/__tabtab.bash || true

#deploy project
alias 'sd'='sls deploy -v'

#deploy function
function sdf {
    sls deploy function -f "$1" -v
}

#invoke function with no logs
alias 'sif'='sls invoke -f'

#invoke function with logs enabled
function sifl {
    sls invoke -f "$1" -l
}

#Deploy and Invoke function with no logs
function sdif {
    sdf "$1" && sls invoke -f "$1"
}

#Deploy and Invoke function with logs
function sdifl {
    sdf "$1" && sls invoke -f "$1" -l
}

#Stream logs to console:
# This is a blocking command
function sfl {
    print "Generating logs for $1"
    sls logs -f "$1" -t
}    

################################# Temp ##################################

function runInteg {
# $1 = MWI_BASE_URL
# $2 = MWI_APP_PORT 

if [ -z "$1" ]
    then
       MWI_BASE_URL=""
    else
       MWI_BASE_URL="$1"
    fi

    if [ -z "$2" ]
    then
       MWI_APP_PORT=8888
    else
       MWI_APP_PORT="$2"
    fi

    #echo -e "MWI_BASE_URL=${MWI_BASE_URL} MWI_APP_PORT=${MWI_APP_PORT}  matlab-jupyter-app \n \n" 
     MWI_BASE_URL=$MWI_BASE_URL MWI_APP_PORT=$MWI_APP_PORT  matlab-web-desktop-proxy "$@"  || MWI_BASE_URL=$MWI_BASE_URL MWI_APP_PORT=$MWI_APP_PORT matlab-jupyter-app "$@"
}
alias 'run_integ'='runInteg'
alias 'runinteg'='runInteg'


alias 'ns'='HOST=localhost npm start'









