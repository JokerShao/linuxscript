# >>> 2021.02.22 Zexi enable terminal color >>>
# Tell ls to be colourful
export CLICOLOR=1
export LSCOLORS=Exfxcxdxbxegedabagacad

# Tell grep to highlight matches
export GREP_OPTIONS='--color=auto'
# <<< 2021.02.22 Zexi enable terminal color <<<


# # >>> 2021.02.28 Zexi change username@hostname color >>>
# if [ -n "$BASH_VERSION" ]; then
#     export PS1='\[\e[38;5;135m\]\u\[\e[0m\]@\[\e[38;5;166m\]\h\[\e[0m \[\e[38;5;118m\]\W\[\e[0m\] \$ '
# else
#     if [ "$UID" -eq 0 ]; then
#         export PROMPT="%F{135}%n%f@%F{166}%m%f %F{118}%~%f %# "
#     else
#         export PROMPT="%F{135}%n%f@%F{166}%m%f %F{118}%~%f \$ "
#     fi
# fi
# # <<< 2021.02.28 Zexi change username@hostname color <<<
PROMPT='%F{green}%*%f:%F{green}%1~%f %# '


# Setting PATH for Python 3.7
# PATH="/Library/Frameworks/Python.framework/Versions/3.7/bin:${PATH}"
# export PATH


# >>> 2021.02.28 Zexi change vim path (installed by homebrew) >>>
Alias vim=/usr/local/bin/vim
# <<< 2021.02.28 Zexi change vim path (installed by homebrew) <<<


# >>> 2021.02.28 Zexi add these configuration for git completion >>>
autoload -Uz compinit && compinit

autoload -Uz vcs_info
precmd_vcs_info() { vcs_info }
precmd_functions+=( precmd_vcs_info )
setopt prompt_subst
RPROMPT=\$vcs_info_msg_0_
# PROMPT=\$vcs_info_msg_0_'%# '
zstyle ':vcs_info:git:*' formats '%b'
# <<< 2021.02.28 Zexi add these configuration for git completion <<<


# >>> Zexi add 2020.06.27 for ubuntu style ls >>>
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
# <<< Zexi add 2020.06.27 for ubuntu style ls <<<


# >>> Zexi add alias 2020.07.04, set port proxy easily >>>
# alias echoproxy="echo -e 'ALL_PROXY:' $ALL_PROXY '\nall_proxy:' $all_proxy"
alias enproxy="export ALL_PROXY='socks5://127.0.0.1:1080'"
alias unproxy="unset ALL_PROXY && unset all_proxy"
# <<< Zexi add alias 2020.07.04, set port proxy easily <<<


# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/zexi/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
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


