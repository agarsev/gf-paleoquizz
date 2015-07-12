#!/usr/bin/env bash

# options

DB_FILE=facts.db

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

get_semtree() {
    IFS=$'\n' semtree=($(echo $1 | perl -e '$/=\1;
    while(<>) {
        if( /\(/ ) { $p++; }
        if( /\)/ ) { $p--; }
        if( / / and $p==0) { print "\n"; }
        else { print; }
    }'))
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
    add)
        ok=false
        gf "p \"$args\""
        get_output
        if ! [[ "$output" =~ "The parser failed" ]]; then
            ok=true
            get_semtree "$output"
        fi
        get_output
        if ! [[ "$output" =~ "The parser failed" ]]; then
            ok=true
            get_semtree "$output"
        fi
        if $ok; then
            echo -e "\e[92mOK\e[0m";
            if [[ ${semtree[0]} == "TimeFocus" ]]; then
                echo "${semtree[2]};${semtree[1]};${semtree[3]}" >>$DB_FILE
            else
                echo "${semtree[2]};${semtree[3]};${semtree[1]}" >>$DB_FILE
            fi
        else
            echo -e "\e[91mERROR\e[0m";
        fi
    ;;
    get)
        sem=$(sort -R $DB_FILE | head -1)
        echo $sem
    ;;
    esac

    flush
    print_prompt
done
