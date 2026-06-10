_lit_completion() {
    local cur

    cur="${COMP_WORDS[COMP_CWORD]}"

    local args=("${COMP_WORDS[@]:1:$((COMP_CWORD-1))}")

    COMPREPLY=(
        $(compgen -W "$(lit __complete "${args[@]}")" -- "$cur")
    )

    # COMPREPLY=($(compgen -W "$(lit __complete)" -- "$cur"))
}

complete -F _lit_completion lit lit-ro
