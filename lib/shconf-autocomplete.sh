_shconf_completion() {
    local cur

    cur="${COMP_WORDS[COMP_CWORD]}"

    COMPREPLY=($(compgen -W "$(shconf __complete)" -- "$cur"))
}

complete -F _shconf_completion shconf
