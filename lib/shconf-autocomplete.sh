_shconf_completion() {
    local cur

    cur="${COMP_WORDS[COMP_CWORD]}"

    local args=("${COMP_WORDS[@]:1:$((COMP_CWORD-1))}")

    COMPREPLY=(
        $(compgen -W "$(shconf __complete "${args[@]}")" -- "$cur")
    )

    # COMPREPLY=($(compgen -W "$(shconf __complete)" -- "$cur"))
}

complete -F _shconf_completion shconf
