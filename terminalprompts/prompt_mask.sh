STOP_COLOR="\033[0m";
BOLD_COLOR="\033[1m";
SUCCESS_COLOR="\032[1;33m";
FAILED_COLOR="\031[1;31m";

function branch()
{
    if [[ -d .git ]] || [[ $(git rev-parse --git-dir 2> /dev/null) ]]; then
        echo -en "\033[1;34m[$(git branch | head -1 | awk '{print $2}')]\033[0m";
    fi
}

function exitcolor()
{
    # The special variable $? holds the exit status of last command
    # If it's 0, then it's successful
    # Else it failed
    # Set the color for the upcoming text accordingly
    if [[ "$?" == "0" ]]; then
        echo -en "$SUCCESS_COLOR";
    else
        echo -en "$FAILED_COLOR";
    fi
}


if [[ $(id -u) == 0 ]]; then
        export PS1='\t\u@\h :[\w] - ';
else
        export PS1="\[\e[33m\]\\$ \[\e[m\]\[\e[32m\]\t \[\e[m\]- \[\e[34m\]\u\[\e[m\]\[\e[34m\]@\[\e[m\]\[\e[34m\]\h\[\e[m\]:[\[\e[35m\]\w\[\e[m\]] -  ";
fi

export PS2='>> ';

