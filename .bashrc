# -*-shell-script-*-
# For information and guidelines on what should and should NOT go
# in here, please read sbsetupunix help:
#   http://inside.mathworks.com/wiki/SBTools#sbsetupunix
# In particular pay attention to the 'Typical Mistakes' that can cause
# significant pain to the company.
# You should also time your changes as explained in sbsetupunix help.

#. /mathworks/hub/share/sbtools/bash_setup.bash 
#. /mathworks/hub/share/sbtools/bash_setup.bash || echo "Did not find bash_setup.bash. Continuing as usual."

if [ -f /mathworks/hub/share/sbtools/bash_setup.bash ]; then
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

# EXPORTS env vars
# export NODE_PATH="/usr/softwares/node-v14.16.0-linux-x64/lib/node_modules/"
export FZF_DEFAULT_OPTS='--height 40% --layout=reverse --border'

# Enable vim shortcuts in bash
set -o vi

# if bash is not default shell for the current OS, then it means that this bash is a child process. Adding ssh-agent
# ssh-agent bash


# Adding custom paths to system path

# Adding anaconda executables to path 

if [ -d /usr/softwares/miniconda3/bin ]; then
    # Add to system path if directory exists
    export PATH="/usr/softwares/miniconda3/bin:$PATH"
fi

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

    elif [ "$1" = "ssh" ]
    then
         vim ~/.ssh/config 

    else                                                                        
        echo "Unknown param: $1"                                                
    fi                                                                          
}   


# extract any type of compressed file
extract () {
  if [ -f $1 ] ; then
      case $1 in
          *.tar.bz2)   tar xvjf $1    ;;
          *.tar.gz)    tar xvzf $1    ;;
          *.bz2)       bunzip2 $1     ;;
          *.rar)       rar x $1       ;;
          *.gz)        gunzip $1      ;;
          *.tar)       tar xvf $1     ;;
          *.tbz2)      tar xvjf $1    ;;
          *.tgz)       tar xvzf $1    ;;
          *.zip)       unzip $1       ;;
          *.Z)         uncompress $1  ;;
          *.7z)        7z x $1        ;;
          *)           echo "don't know how to extract '$1'..." ;;
      esac
  else
      echo "'$1' is not a valid file!"
  fi
}


# Adding pipenv virtualenvs path 
export PATH="/home/skondapa/.local/bin:$PATH"

# export PATH="/usr/softwares/miniconda3/bin:$PATH"  # commented out by conda initialize

#reload/source bashrc
alias 'sourcerc'='source ~/.bashrc'

# copy/paste to system clipboard
alias copy='xsel --clipboard --input'
alias paste='xsel --clipboard --output'


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
}

# Clear the screen.
function c(){
    clear;
}

# Show the command line history.
function h(){
    history;
}

# Go back directory level.
function ..(){
    builtin cd ..; pwd;
}

# Go back directory level.
function ...(){
    builtin cd ../..; pwd;
}

# List almost all files with classification.
function l(){
    ls --color=auto -F;
}

# List all files with classification.
function la(){
    ls --color=auto -A -F;
}

# Long list almost all files with classification and a humanly-readable size.
function ll(){
    ls --color=auto -A -F -l -h;
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
alias 'pirm'='pip uninstall -y'
alias 'py'='python'
alias 'sdist'='rm -rf dist/ ; py setup.py sdist ; pip install dist/*'

# Pip install 
function pi {
    if [ -z "$1" ]
    then 
        pip install .
    else 
        pip install "$1"
    fi
}

# Create new venv using python3
# If no name is passed will default to .venv
function mkvenv {
    if [ -z "$1" ]
    then
        print "Creating virtualenv: .venv"
        python3 -m venv .venv
        avenv
    else
        print "Creating virtualenv: $1"
        python3 -m venv "$1"
        avenv "$1"
    fi

    print "Upgrading pip"
    pip install pip --upgrade

    print "Installing wheel package"
    pip install wheel
    print "Activated virtualenv"
}

alias 'mkenv'='mkvenv'

# Remove a virtual env.
# If no name is passed will default to .venv
function rmvenv {
    if [ -z "$1" ]
    then
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
    # If no paramerter is passed try to activate .venv first. If .venv doesnt exist try with the next closest one. If both .venv37 and .venv38 exist. It will pick .venv37
    # If parameter is passed, try to activate that one
    if [ -z "$1" ]
    then

        if [ -d ".venv" ] 
        then
            source .venv/bin/activate 
            print "Activated virtualenv: .venv" 

        else   
            virtual_env=$(find -maxdepth 2  -type d -name ".venv*"  | fzf)  
            print "Activated virtualenv: $virtual_env" 
            source "$virtual_env"/bin/activate
        fi 

    else
         source "$1"/bin/activate; print "Activated virtualenv: $1" || print "Failed to activate virtualenv: $1"

    fi
}

alias 'aenv'='avenv'

# Deactivate virtual env

function dvenv {

    if [ -z "$1" ]
    then
        deactivate || print "Failed to deactivate virtualenv: .venv"
        print "Deactivated virtualenv"
    else
        deactivate "$1" || print "Failed to deactivate virtualenv: $1"
        print "Deactivated virtualenv" 
    fi
}
alias 'denv'='dvenv'

##########################git##########################

#git aliases
alias 'gs'='git status'
alias 'glo'='git log --oneline'
alias 'gl'='git log'
alias 'gc'='git commit -m'
alias 'glsb'='git branch'
alias 'glsba'='git branch -a'
alias 'glsbv'='git branch -v'
alias 'gbav'='git branch -av'
alias 'glss'='git stash list'
alias 'gsp'='git stash push -m'
alias 'glsremote'='git remote -v'



function gaddremote {
        git remote add "$1" "$2"
}

function grenameremote {
    git remote rename "$1" "$2"
}

# Add files provided as arguments to Git.
function ga() {
    git add "$*";
}

function gchb {
    if [ -z "$1" ]
    then
        git checkout `glsb | fzf` #| awk '{print $1}'`
    else
        git checkout "$1"
    fi
}

# Add all changed files to Git.
function gaa() {
    git add --all;
}

# Add all tracked files. Ignores untracked files.
function gaat() {
    git add -u;
}

# Fetch repo and fetch merge request
function gfmr {
    default_repo="https://insidelabs-git.mathworks.com/cit/mathworks/jupyter-matlab-proxy.git "
    print "Cloning default repo: jupyter-matlab-proxy from insidelabs"
    git clone $default_repo . || echo -e "Failed to clone repo" 
    print "Fething merge request !$1 with branch name: $2"
    git fetch origin merge-requests/"$1"/head:"$2" || print "Failed to fetch branch $2 of merge-request $1"
}

# Fetch repo and fetch merge request and install packages
function gfmrip {
    gfmr "$1" "$2"
    mkvenv
    avenv
    print "Installing dependencies"
    pip install -e .[DEV]
    print "Checking out to branch $2"
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
function cmkvenv {
   mkdir -p /usr/softwares/miniconda3/envs/"$1"
#  mamba create -n "$1" --prefix=/usr/softwares/miniconda3/envs/"$1" python="$2" -y
  conda create  --prefix=/usr/softwares/miniconda3/envs/"$1" python="$2" -y
}
alias 'cmkenv'='cmkvenv'

# remove arbitrary number of conda virtual envs
function crmenv {
  mamba env remove -n "$@"
}

alias 'crmvenv'='crmenv'

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
alias "cdenv"="cdvenv"

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
function clsch {
  conda config --show channels
}

# remove a channel
function crmch {
    conda config --remove channels "$1"
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
alias 'dlsi'='d images'


# "Private" generic function which is used in the below functions
function __dex {
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
function drmc {
    docker container rm "$@"
}

# Force remove arbitrary number of docker containers
function drmfc {
    docker container rm -f "$@"
}

# Remove arbitrary number of  docker images
function drmi {
    docker image rm "$@"
}

# Force remove arbitrary number of docker images
function drmfi {
    docker image rm -f "$@"
}

# When run interactively, you want to use a shell
# docker run bash
function drrmit {
    docker run --rm -it "$1" bash
}

# docker run sh
function drrmits {
    docker run --rm -it "$1" sh
}

# When run in detached mode, you may want to pass an arg
function drd {
    docker run -d "$1" "$2"
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

################################ tmux ##################################

# Always assuming you never want to nest anything : sessions, tmux server etc.
# If making a new session, it will never be a new nested session. It will always
# be a new session alongside/sibling-of the current session.


# To navigate to next  session : prefix + (
# To navigate to previous  session : prefix + )
# To navigate to previous  window  : prefix + p
# To navigate to next  window  : prefix + n
# To split a window : prefix + %

function __select_session {
    selected_option=$(tls | fzf)
    arr=(${selected_option//:/ })
    session_name=${arr[0]}
    echo $session_name
}

function __select_window {
    selected_option=$(tmux list-windows | fzf) 
    arr=(${selected_option//:/ })
    chosen_window=${arr[0]}
    echo $chosen_window
}

function ta {
    if [ -z "$1" ]
    then
        __select_session session_name
        tmux -u attach -t "$session_name"
    else
        tmux -u attach -t "$1"
    fi
}

function td {
    tmux detach 
}


################ tmux session related stuff ################

function trmserver {
    tmux kill-server
}

function trmsession {
    tmux kill-session
}


function tls {
    tmux list-sessions  
}


function __tmks {
    if [ -z "$1" ]
    then
        print "Error: tmux session must have a name"
        return 
    fi
    
    if [ -z "$2" ]
    then
        if tmux -u new-session -s "$1" /bin/bash > /dev/null 2>&1; then
            print "Created session on a new server with name $1"
        else
            print "Already in a session. Will create a detached session with name $1"
            tmux -u new-session -d -s "$1" /bin/bash 
        fi
    else
        if tmux -u new-session -s "$1" -c "$2" /bin/bash > /dev/null 2>&1; then
            print "Created session on a new server with name $1 and path $2"
        else
            print "Already in a session. Will create a detached session with name $1 and path $2"
            tmux -u new-session -d -s "$1" -c "$2" /bin/bash 
        fi

    fi
}


# Change/Switch to a session
function tchs {
    if [ -z "$1" ]
    then
        session_name=$(__select_session)
    else 
        session_name=$1
    fi
    
    # For $1, you can pass either session_name or session_name and window_name or 
    # session_name and window_name and pane_number.
    # Format is : <session_name>:<window_name>:<pane_number>

    tmux switch-client -t $session_name 2> /dev/null
    
}

# tmux-sessionizer
function tmux_sessionizer {
    common_directories=(~ ~/Downloads ~/Documents)                                  

    personal_directories=(~/work ~/work/personal)                                   
    
    office_directories=(~ /sandbox/skondapa/Projects/fte/jupyter_matlab_proxy /sandbox/skondapa/Projects/fte /work)
    
    all_directories+=( "${personal_directories[@]}"  "${office_directories[@]}" "${common_directories[@]}" )

    valid_directories=()                                                            
                                                                                    
    for directory in ${all_directories[@]}; do                                      
        if [ -d $directory ]; then                                                  
            valid_directories[${#valid_directories[@]}]=$directory                  
        fi                                                                          
    done                                                                            

    if [[ $# -eq 1 ]]; then
        complete_path=$1
    else
        complete_path=$(find ${valid_directories[*]} -mindepth 1 -maxdepth 2  -type d | fzf)  
    fi
                                                                                    
    folder_name=$(basename "$complete_path" | tr . _)                                    
                                                                                    
    if ! tmux has-session -t "$folder_name"; then                                  
        __tmks "$folder_name" "$complete_path"                                             
    fi                                                                              
                                                                                    
    tchs "$folder_name"   
}

alias 'ts'='tmux_sessionizer'

################ tmux window related stuff ################

#function tmkw {
#    tmux new-window    
#}

function tmkw {
    if [ -z "$1" ]
    then
        print "Error: tmux window must have a name"
        return 
    fi
   
    cwd=$(pwd)
    if [ -z "$2" ]
    then
       tmux -u new-window -n "$1" -c cd $cwd  bash
    else
       tmux -u new-window -n "$1"  -c "$2" bash
    fi
}

function tmvw {
    tmux rename-window "$1"
}

function tchw {
    if [ -z "$1" ]
    then
        window_name=$(__select_window)
    else 
        window_name=$1
    fi
    
    # Will use tchs to change to current active session and the window_name using the format 
    # Format is : <session_name>:<window_name>:<pane_number>

    current_session_name=$(tmux display-message -p '#S')
    tchs $current_session_name:$window_name
}

################################# Key Bindings ##################################

# Binds Ctrl + t to launch tmux sessionizer
bind -x '"\C-t":"tmux_sessionizer"'

# Binds Ctrl + f to launch tmux sessionizer
bind -x '"\C-f":"tchw"'













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
     MWI_BASE_URL=$MWI_BASE_URL MWI_APP_PORT=$MWI_APP_PORT  matlab-web-desktop-app "$@" ||  MWI_BASE_URL=$MWI_BASE_URL MWI_APP_PORT=$MWI_APP_PORT  matlab-web-desktop-proxy "$@"  || MWI_BASE_URL=$MWI_BASE_URL MWI_APP_PORT=$MWI_APP_PORT matlab-jupyter-app "$@"
}
alias 'run_integ'='runInteg'
alias 'runinteg'='runInteg'

function denvs {
      print "Exiting out of any virtualenvs"
      cdenv
      denv
}


function setup_versions {

    for ((i=1; i<=$#; i++))
        do
          denvs

          print "Using python ${!i}"
          print "Removing any existing folder  .venv${!i}"
          rm -rf .venv"${!i}"
          
          caenv p"${!i}"
          mkvenv .venv"${!i}"
          denvs

        done
}

function install_in_versions {
    for ((i=1; i<=$#; i++))
        do
          setup_versions "${!i}"

          avenv .venv"${!i}"
          pip install .[dev]
          print "Finished installing package in .venv${!i}"
          denv
          
        done
}

. "$HOME/.cargo/env"
