#
# Utility Functions and Options
#

# Set most, less or more as the default pager.
if (( ! ${+PAGER} )); then
  if (( ${+commands[most]} )); then
    export PAGER=most
  elif (( ${+commands[less]} )); then
    export PAGER=less
  else
    export PAGER=more
  fi
fi

#
# Colours
#

if (( terminfo[colors] >= 8 )); then

  # ls Colours
  if (( ${+commands[dircolors]} )); then
    # GNU

    (( ! ${+LS_COLORS} )) && if [[ -s ${HOME}/.dir_colors ]]; then
      eval "$(dircolors --sh ${HOME}/.dir_colors)"
    else
      export LS_COLORS='di=1;34:ln=35:so=32:pi=33:ex=31:bd=1;36:cd=1;33:su=30;41:sg=30;46:tw=30;42:ow=30;43'
    fi

    alias ls='ls --group-directories-first --color=auto'
  else
    # BSD

    if (( ! ${+CLICOLOR} )) export CLICOLOR=1
    if (( ! ${+LSCOLORS} )) export LSCOLORS='ExfxcxdxbxGxDxabagacad'

    # stock OpenBSD ls does not support colors at all, but colorls does.
    if [[ ${OSTYPE} == openbsd* && ${+commands[colorls]} -ne 0 ]]; then
      alias ls='colorls'
    fi
  fi

  # grep Colours
  if (( ! ${+GREP_COLOR} )) export GREP_COLOR='37;45'               #BSD
  if (( ! ${+GREP_COLORS} )) export GREP_COLORS="mt=${GREP_COLOR}"  #GNU
  if [[ ${OSTYPE} == openbsd* ]]; then
    if (( ${+commands[ggrep]} )) alias grep='ggrep --color=auto'
  else
   alias grep='grep --color=auto'
  fi

  # less Colours
  if [[ ${PAGER} == 'less' ]]; then
    if (( ! ${+LESS_TERMCAP_mb} )) export LESS_TERMCAP_mb=$'\E[1;31m'   # Begins blinking.
    if (( ! ${+LESS_TERMCAP_md} )) export LESS_TERMCAP_md=$'\E[1;31m'   # Begins bold.
    if (( ! ${+LESS_TERMCAP_me} )) export LESS_TERMCAP_me=$'\E[0m'      # Ends mode.
    if (( ! ${+LESS_TERMCAP_se} )) export LESS_TERMCAP_se=$'\E[27m'     # Ends standout-mode.
    if (( ! ${+LESS_TERMCAP_so} )) export LESS_TERMCAP_so=$'\E[7m'      # Begins standout-mode.
    if (( ! ${+LESS_TERMCAP_ue} )) export LESS_TERMCAP_ue=$'\E[0m'      # Ends underline.
    if (( ! ${+LESS_TERMCAP_us} )) export LESS_TERMCAP_us=$'\E[1;32m'   # Begins underline.
  fi
fi


#
# ls Aliases
#

alias l='ls -lh'         # long format and human-readable sizes
alias ll='l -A'           # long format, all files
alias lr='l -R'          # long format, recursive


#
# Resource Usage
#

alias df='df -h'
alias du='du -h'


#
# GNU only
#

if (( ${+commands[dircolors]} )); then

  # Always wear a condom
  alias chmod='chmod --preserve-root -v'
  alias chown='chown --preserve-root -v'
  alias chgrp='chgrp --preserve-root -v'
fi
