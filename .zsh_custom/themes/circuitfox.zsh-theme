setopt prompt_subst
autoload -U colors && colors

GIT_PROMPT_PREFIX=" %{$fg[magenta]%}"
GIT_PROMPT_SUFFIX="%{$reset_color%}"
GIT_PROMPT_AHEAD="%{$fg[green]%}+NUM"
GIT_PROMPT_BEHIND="%{$fg[red]%}-NUM"
GIT_PROMPT_STAGED="%{$fg[green]%}S"
GIT_PROMPT_UNTRACKED="%{$fg[red]%}U"
GIT_PROMPT_MODIFIED="%{$fg[yellow]%}M"

# git prompt -- adapted from https://gist.github.com/joshdick/4415470

function parse_git_branch {
    (git symbolic-ref -q --short HEAD || git name-rev --name-only --no-undefined --always HEAD) 2> /dev/null
}

function parse_git_state {
    local GIT_STATE=" "

    if ! git diff --cached --quiet 2> /dev/null; then
        GIT_STATE="$GIT_STATE$GIT_PROMPT_STAGED"
    fi

    if ! git diff --quiet 2> /dev/null; then
        GIT_STATE="$GIT_STATE$GIT_PROMPT_MODIFIED"
    fi

    if [[ -n $(git ls-files --other --exclude-standard 2> /dev/null) ]]; then
        GIT_STATE="$GIT_STATE$GIT_PROMPT_UNTRACKED"
    fi

    local NUM_AHEAD="$(git log --oneline @{u}.. 2> /dev/null | wc -l | tr -d ' ')"
    if [ "$NUM_AHEAD" -gt 0 ]; then
        if [ $GIT_STATE != " " ]; then
            GIT_STATE="$GIT_STATE "
        fi
        GIT_STATE="$GIT_STATE${GIT_PROMPT_AHEAD//NUM/$NUM_AHEAD}"
    fi

    local NUM_BEHIND="$(git log --oneline ..@{u} 2> /dev/null | wc -l | tr -d ' ')"
    if [ "$NUM_BEHIND" -gt 0 ]; then
        if [ $GIT_STATE != " " ]; then
            GIT_STATE="$GIT_STATE "
        fi
        GIT_STATE="$GIT_STATE${GIT_PROMPT_BEHIND//NUM/$NUM_AHEAD}"
    fi

    if [[ -n $GIT_STATE ]]; then
        echo "$GIT_STATE"
    fi
}

function git_prompt_string {
    local git_where="$(parse_git_branch)"
    [ -n "$git_where" ] && echo "$GIT_PROMPT_PREFIX${git_where#(refs/heads/|tags/)}$GIT_PROMPT_SUFFIX$(parse_git_state)"
}

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
