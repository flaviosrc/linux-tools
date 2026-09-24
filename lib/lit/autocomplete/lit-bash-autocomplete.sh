_lit_completion() {
    local cur="${COMP_WORDS[COMP_CWORD]}"

    local args=("${COMP_WORDS[@]:1:$((COMP_CWORD-1))}")

    local opts="$(lit __complete "${args[@]}")"

    if [ -n "$opts" ]; then
        COMPREPLY=($(compgen -W "$opts" -- "$cur"))
    else
        COMPREPLY=()
    fi
}

complete -o default -F _lit_completion lit lit-ro
