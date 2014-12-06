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
        GIT_STATE="$GIT_STATE${GIT_PROMPT_BEHIND//NUM/$NUM_BEHIND}"
    fi

    if [ $GIT_STATE != " " ]; then
        echo "$GIT_STATE"
    fi
}
