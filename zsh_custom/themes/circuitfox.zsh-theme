
ZSH_THEME_GIT_PROMPT_PREFIX=" %{$fg[yellow]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[yellow]%}*"
ZSH_THEME_GIT_PROMPT_CLEAN=""

function prompt_char {
	if [[ $UID -eq 0 ]]; then echo "#"; else echo $; fi
}

function ssh_flag {
	if [[ -n $SSH_CONNECTION ]]; then echo "%{$fg[red]%}[ssh]%{$reset_color%} "; fi
}

function err_out {
	echo "%(?..%{$fg[red]%}%?%{$reset_color%} )"
}

function host_out {
	echo "$(ssh_flag)%{$fg[green]%}%n@%m%{$reset_color%}:"
}

function path_out {
	echo "%{$fg[blue]%}%~%{$reset_color%}"
}

function time_out {
	echo "%{$fg[cyan]%}[%*]%{$reset_color%}"
}

PROMPT='$(host_out) $(path_out)$(git_prompt_info) $(err_out)$(time_out)
%_$(prompt_char) '

RPROMPT=''
