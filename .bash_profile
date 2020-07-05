# Tell ls to be colourful
export CLICOLOR=1
export LSCOLORS=Exfxcxdxbxegedabagacad

# Tell grep to highlight matches
export GREP_OPTIONS='--color=auto'

if [ -n "$BASH_VERSION" ]; then
    export PS1='\[\e[38;5;135m\]\u\[\e[0m\]@\[\e[38;5;166m\]\h\[\e[0m \[\e[38;5;118m\]\W\[\e[0m\] \$ '
else
    if [ "$UID" -eq 0 ]; then
        export PROMPT="%F{135}%n%f@%F{166}%m%f %F{118}%~%f %# "
    else
        export PROMPT="%F{135}%n%f@%F{166}%m%f %F{118}%~%f \$ "
    fi
fi

# Setting PATH for Python 3.7
PATH="/Library/Frameworks/Python.framework/Versions/3.7/bin:${PATH}"
export PATH

# Zexi add this line 2019-08-18 to change homebrew source
export HOMEBREW_BOTTLE_DOMAIN=https://mirrors.ustc.edu.cn/homebrew-bottles

# Zexi add this line for completion
[[ -r "/usr/local/etc/profile.d/bash_completion.sh" ]] && . "/usr/local/etc/profile.d/bash_completion.sh"

# >>> Zexi add 2020.06.27 for git-completion >>>
if [ -f ~/.git-completion.bash ]; then
   . ~/.git-completion.bash
fi
# <<< Zexi add 2020.06.27 for git-completion <<<

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/zexi/anaconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/zexi/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/zexi/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/zexi/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

# >>> Zexi add 2020.06.27 for ubuntu style ls >>>
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
# <<< Zexi add 2020.06.27 for ubuntu style ls <<<

# >>> Zexi add updatedb alias 2020.07.04 >>>
alias updatedb="sudo /usr/libexec/locate.updatedb"
# <<< Zexi add updatedb alias 2020.07.04 <<<

# >>> Zexi add alias 2020.07.04, set port proxy easily >>>
# alias echoproxy="echo -e 'ALL_PROXY:' $ALL_PROXY '\nall_proxy:' $all_proxy"
alias enproxy="export ALL_PROXY='socks5://127.0.0.1:1080'"
alias unproxy="unset ALL_PROXY && unset all_proxy"
# <<< Zexi add alias 2020.07.04, set port proxy easily <<<


