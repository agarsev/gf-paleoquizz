#!/usr/bin/env bash

# Run GF in background
coproc gf 2>/dev/null
GFI=${COPROC[1]}
GFO=${COPROC[0]}

# functions

flush() {
    while read -t 0.1 -u $GFO resp; do :; done
}

gf() {
    echo $1 >&$GFI
}

get_output() {
    read -t 1 -u $GFO output
}

print_prompt() {
    printf "> "
}

# START

flush

gf "i PaleoEng.gf PaleoSpa.gf"

flush
print_prompt
while read line; do

    comm=${line%%[ ]*}
    args=${line#*[ ]}

    case $comm in
    add | añadir)
        gf "p \"$args\""
        get_output
        if ! [[ "$output" =~ "The parser failed" ]]; then
            echo "english: $output"
        fi
        get_output
        if ! [[ "$output" =~ "The parser failed" ]]; then
            echo "spanish: $output"
        fi
    ;;
    esac

    flush
    print_prompt
done
