#!/usr/bin/env bash

# options

DB_FILE=facts.db
MAX_QUESTIONS=5

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
    if [[ -z $answers ]]; then
        answers=$output
    else
        answers=$answers$'\n'$output
    fi
}

add_correct_answer() {
    gf "lin -lang=$1 $2 $3 $4 $5"
    get_output
    flush
    correct=$output
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
    help)
        echo "Commands:"
        echo -e "\tadd 'sentence': add sentence to the database of facts"
        echo -e "\tquiz Eng|Spa: take a quiz on paleontological facts in the chosen language"
    ;;
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
        total=0
        if [[ $args == 'Spa' ]]; then
            lang=Spa
            prompt="Elige la opción correcta:"
        else
            lang=Eng
            prompt="Choose the correct option:"
        fi
        facts=$(sort -R $DB_FILE | head -$MAX_QUESTIONS)
        IFS=$'\n'
        for action in $facts; do
            total=$((total+1))
            echo $prompt
            IFS=';' sem=($action)
            answers=''
            if [[ $(( $RANDOM % 2 )) == 0 ]]; then
                add_random_answer $lang TimeFocus ${sem[1]} ${sem[0]} ?
                add_random_answer $lang TimeFocus ${sem[1]} ${sem[0]} ?
                add_random_answer $lang TimeFocus ${sem[1]} ${sem[0]} ?
                add_correct_answer $lang TimeFocus ${sem[1]} ${sem[0]} ${sem[2]}
            else
                add_random_answer $lang TimeTopic ${sem[2]} ${sem[0]} ?
                add_random_answer $lang TimeTopic ${sem[2]} ${sem[0]} ?
                add_random_answer $lang TimeTopic ${sem[2]} ${sem[0]} ?
                add_correct_answer $lang TimeTopic ${sem[2]} ${sem[0]} ${sem[1]}
            fi
            answers=$(sort -u <<<$answers | sort -R)
            echo $answers | nl -nln -w1 -s') '
            IFS=$'\n' answers=($answers)
            echo -n ": "
            read -r ans
            if [[ ${answers[$((ans-1))]} == $correct ]]; then
                points=$((points+1))
            fi
        done
        echo "points: $points/$total"
    ;;
    esac

    flush
    print_prompt
done
