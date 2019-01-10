function ls {
    /bin/ls "$@"
    
    export ENV_VAR=two
}
