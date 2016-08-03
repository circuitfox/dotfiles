setopt prompt_subst
autoload -U colors && colors

if [ -f "$ZSH_CUSTOM/lib/git-prompt.zsh" ]; then
    . "$ZSH_CUSTOM/lib/git-prompt.zsh"

    function git_prompt_string {
        local git_where="$(parse_git_branch)"
        [ -n "$git_where" ] && echo "$GIT_PROMPT_PREFIX${git_where#(refs/heads/|tags/)}$GIT_PROMPT_SUFFIX$(parse_git_state)"
    }
else
    function git_prompt_string {
    }
fi

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

PROMPT='$(host_out) $(path_out)$(git_prompt_string) $(err_out)$(time_out)
%_$(prompt_char) '

RPROMPT=''
