MULTILINGUAL PALEONTOLOGICAL QUIZ
==================================

Coursework for Advanced Issues in LCT/Multilingual Computing
HLST master, LCT Programme, University of Malta
Antonio F. G. Sevilla <antonio@garciasevilla.com>
13 July 2015

About
-----
This coursework is a quiz on paleontology facts such as might be used by a
teacher or learner on the subject. It utilizes the multilingual and natural
language capabilities of Grammatical Framework for performing the translation
between user input and output and an abstract store of scientific facts (GF
categories).

Files
-----
* _paleo.sh_: Shell script, main program
* _Paleo.gf_: Abstract syntax for a paleontology domain
* _PaleoEng.gf_: English concrete syntax
* _PaleoSpa.gf_: Spanish concrete syntax
* _facts.db_: Example database of paleontological facts
* _REPORT.md_: This document

Requirements
------------
* A working GF installation (`gf` command)
* Bash
* Standard modern Linux/UNIX environment

Developed and tested on Ubuntu Linux 14.04, kernel version 3.13.0-57-generic,
bash version 4.3.11(1)-release

Usage
-----
The entry point of the coursework is the script `paleo.sh`. It is recommended
that it is executed with a readline wrapper such as `rlwrap(1)`, but it is not
necessary.

The script provides a prompt through which the user has access to the following
commands:
- `help`: gives some information on the commands.
- `add`: parses and introduces a new sentence into the fact database, for it to
  be used by the quiz.
- `quiz`: makes an interactive quiz for the user to solve, asking single-choice
  test questions on facts found in the database.

Expert input
------------

Quizzing
--------

An example:
    > quiz
    Choose the correct option:
    1) the early amniotes diversified during the Permian
    2) the early amniotes diversified during the Miocene
    3) the early amniotes diversified at the Carboniferous
    4) the early amniotes diversified during the Paleocene
    : 4
    Choose the correct option:
    1) placental mammals appeared during the Pliocene
    2) placental mammals appeared during the Triassic
    3) placental mammals appeared at the end of the Triassic
    4) placental mammals appeared at the beginning of the Cretaceous
    : 4
    Choose the correct option:
    1) Reptiles evolved from Amphibians at the Carboniferous
    2) Reptiles evolved from Amphibians during the Carboniferous
    3) Reptiles evolved from Amphibians during the Precambrian
    4) Reptiles evolved from Amphibians from the Devonian to the end of the Carboniferous
    : 2
    Choose the correct option:
    1) the period from the Cambrian to the Quaternary has fossiles of Brachiopods
    2) the period from the Cambrian to the Quaternary has fossiles of Fishes
    3) the period from the Cambrian to the Quaternary has fossiles of Amphibians
    4) the period from the Cambrian to the Quaternary has fossiles of the early amniotes
    : 1
    Choose the correct option:
    1) the end of the Cretaceous witnessed the extinction of Mollusks
    2) the end of the Cretaceous witnessed the extinction of Dinosaurs
    3) the end of the Cretaceous witnessed the extinction of modern bony fishes
    4) the end of the Cretaceous witnessed the extinction of Amphibians
    : 2
        Choose the correct option:
    1) modern bony fishes appeared at the Cambrian
    2) modern bony fishes appeared during the Silurian
    3) modern bony fishes appeared from the end of the Jurassic to the beginning of the Quaternary
    4) modern bony fishes appeared at the beginning of the Pliocene
    : 2
    points: 5/6
    >

Abstract Grammar
----------------

Caveats
-------

