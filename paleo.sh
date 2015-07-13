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

add_random_answer() {
    gf "gr $2 $3 $4 $5 | lin -lang=$1"
    get_output
    flush
    answers=$answers$'\n'$output
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
            echo -e "\e[91mERROR\e[0m: sentence not understood";
        fi
    ;;
    quiz)
        points=0
        if [[ $args == 'Spa' ]]; then
            lang=Spa
            prompt="Elige la opción correcta:"
        else
            lang=Eng
            prompt="Choose the correct option:"
        fi
        facts=$(sort -R $DB_FILE | head -10)
        IFS=$'\n'
        for action in $facts; do
            echo $prompt
            IFS=';' sem=($action)
            gf "lin -lang=$lang TimeFocus ${sem[1]} ${sem[0]} ${sem[2]}"
            get_output
            flush
            correct=$output
            answers=$correct
            add_random_answer $lang TimeFocus ${sem[1]} ${sem[0]} ?
            add_random_answer $lang TimeFocus ${sem[1]} ${sem[0]} ?
            add_random_answer $lang TimeFocus ${sem[1]} ${sem[0]} ?
            answers=$(sort -R <<<$answers)
            echo $answers | paste <(echo -n $'1)\n2)\n3)\n4)') - -d' '
            IFS=$'\n' answers=($answers)
            echo -n ": "
            read -r ans
            if [[ ${answers[$((ans-1))]} == $correct ]]; then
                points=$((points+1))
            fi
        done
        echo "points: $points"
    ;;
    esac

    flush
    print_prompt
done
