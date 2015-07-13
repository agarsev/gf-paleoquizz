MULTILINGUAL PALEONTOLOGICAL QUIZ
==================================

Coursework for Advanced Issues in LCT/Multilingual Computing  
HLST master, LCT Programme, University of Malta  
Antonio F. G. Sevilla <antonio@garciasevilla.com>  
13 July 2015

---

About
-----
This coursework is a quiz on paleontology facts such as might be used by a
teacher or learner on the subject. It utilizes the multilingual and natural
language capabilities of Grammatical Framework for performing the translation
between user input and output and an abstract store of scientific facts (GF
categories).

Files
-----
* _`paleo.sh`_: Shell script, main program
* _`Paleo.gf`_: Abstract syntax for a paleontology domain
* _`PaleoEng.gf`_: English concrete syntax
* _`PaleoSpa.gf`_: Spanish concrete syntax
* _`facts.db`_: Example database of paleontological facts
* _`REPORT.md`_: This document in markdown version
* _`REPORT.html`_: This document in HTML version

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
The expert can add paleontological facts to the database via the `add` command.
This command takes as arguments the natural language fact, either in Spanish or
English.

It then gives the sentence for GF to parse and try to build an abstract syntax
tree. If this process succeeds, the AST is then stored (in a slightly different
format) in the fact database for later perusal.

For example:

    > add los mamuts se extinguieron a el final de el Pleistoceno
    OK
    > add Trilobites are known in the fossil record from the Cambrian to the Permian
    OK
    > add the end of the Permian witnessed the extinction of Trilobites
    OK
    > add los amonites existen en el registro fósil desde el Devónico a el Cretácico
    OK
    > add Fishes appeared in the Cambrian
    ERROR: sentence not understood
    > add Fishes appeared during the Cambrian
    OK
    > add Mammals experienced a significant adaptive radiation at the beginning of the Paleocene
    OK
    > 

Quizzing
--------
After the fact database is built, the user can ask to be given a quiz with the
command `quiz`. This gives a simple single-choice test with a configurable
number of questions. The user has to choose for each question the correct fact
between a number of different options. The test is inspired by the translation
quiz used as an example for GF, and uses its random generation capabilities.

Since the Paleontology Grammar supports two languages (English and Spanish) the
user can choose which language to be asked the questions in (_Eng_ or _Spa_,
respectively). It does not matter what language the facts were input in, since
only the abstract meaning is stored, and so more languages could be added to
cater to a multilingual audience while still introducing facts in the chosen
language of the instructor.

All questions relate to a single fact, and provide a random listing of three to four
options, one of them the correct answer, and some other ones where the last
concept has been swapped for a randomly generated, linguistically appropriate
choice made by the GF cli.

The Paleontology Grammar supports two types of structures, one with the period
as the topic and the group as the focus (see section Paleontology Grammar below)
and the another one with the two exchanged. That means that the word ordering of
the sentence as presented by the quiz may not be the same every time.

For the moment, only simple questions where the focus of the statement is
randomized are used. If more difficulty was needed, the code could be changed to
randomize more parts of the sentence, or provide more options.

Some examples:

    > quiz Eng
    Choose the correct option:
    1) Fishes appeared at the beginning of the Carboniferous
    2) Fishes appeared from the beginning of the Oligocene to the Recent
    3) Fishes appeared during the Cambrian
    4) Fishes appeared from the Jurassic to the Permian
    : 3
    Choose the correct option:
    1) the beginning of the Paleocene witnessed a significant adaptive radiation of Fishes
    2) the beginning of the Paleocene witnessed a significant adaptive radiation of flowering plants
    3) the beginning of the Paleocene witnessed a significant adaptive radiation of Mammals
    : 3
    Choose the correct option:
    1) Mammoths became extinct during the Pleistocene
    2) Mammoths became extinct from the Recent to the end of the Pleistocene
    3) Mammoths became extinct at the end of the Pleistocene
    4) Mammoths became extinct during the Cretaceous
    : 3
    Choose the correct option:
    1) placental mammals appeared during the Cretaceous
    2) placental mammals appeared at the beginning of the Cretaceous
    3) placental mammals appeared from the Precambrian to the Recent
    : 2
    Choose the correct option:
    1) the Permian witnessed the diversification of Brachiopods
    2) the Permian witnessed the diversification of Reptiles
    3) the Permian witnessed the diversification of the early amniotes
    4) the Permian witnessed the diversification of modern bony fishes
    : 4
    points: 4/5

    > quiz Spa
    Elige la opción correcta:
    1) los braquiópodos existen en el registro fósil durante el Cámbrico
    2) los braquiópodos existen en el registro fósil a el final de el Mioceno
    3) los braquiópodos existen en el registro fósil durante el Precámbrico
    4) los braquiópodos existen en el registro fósil desde el Cámbrico a la
    actualidad
    : 4


Paleontology Grammar
--------------------
The paleontology grammar used for this coursework consists of three files, one
for the abstract syntax and one each for the concrete syntax of English and Spanish.

### Abstract Syntax

The facts we are interested in for the paleontology quiz are shaped in a very
determinate way. They are facts about events that happened at some point in
the history of Life, and involved a determinate group of living beings. Thus, we can
identify three main components in our facts:

1. The event (called Action in the grammar)
2. The group of living beings, usually a clade but can also be a more specific term
   (such as a noun with an adjective, for example _modern bony fishes_)
3. The time when the event happened.

The Abstract syntax allows for two shapes of sentences. The two forms correspond
to a single fact, but one uses the group as topic (and time as focus) and the
other one switches the roles. It is a matter of argument whether the topic/focus
division of natural language should belong to concrete or abstract syntax, but
we choose the latter since for this coursework it makes it easier to generate
the random sentences. It could also be argued that the distinction is actually
semantic, but in our discussion of plain statements for the quiz, this is not really
relevant, and in fact introduces a small second level of abstraction in the fact
database.

The actions and groups don't present further complexity, apart from some actions
(events) being actually functions that can take other elements as arguments. To
further improve the quiz, questions could be made to randomize these embedded
arguments as well. An example of this is the event "EvolveFrom", which requires
a group to evolve from.

Time, however, is a bit more interesting. Apart from the number of different
periods in geological time, some more precision must be allowed. For example,
ranges have to be accomodated, and specific points such as the beggining of, and
the end of, have to also be taken into account. Not every category can be part
of an interval, and some of them cannot stand alone either. The end result can
be seen near the top of the abstract grammar.

### Concrete grammars

The concrete grammars are very simple, expressing the abstract one as actual
string tokens, and relating the different components via concatenation. Both for
Spanish and English, they make use of a parameter `TimePosition` which expresses
whether the topic of the sentence is the time or the group of the event. This
parameter is necessary to account for different ways of realizing the different
components of the sentence, beyond simple word order permutation.

All Actions/events have this distinction, since the focalization of the time
requires a specific construction more complex than passivization. On the other
hand, how the different times are realized also depends on their position in the
sentence, since when in focus they are adverbial complements and when in topic
they become nominal groups. The clades (`Group`s in the grammar) don't change
their form, so they don't require the parameter.

Conclusion
----------
Even in a rather limited setting and with a small set of possibilities, this
coursework shows that the multilingual architecture of GF is very fit for a
teaching environment, where natural language can be translated both to other
languages (for aiding international students, for example) and to neutral
semantic forms that can be stored and manipulated. This manipulation allows for
the very simple creation of exam-like tests by the computer, or maybe other more
sophisticated studying aids.

The concrete syntax linearization into different languages hints at the
possibility of tailoring exam questions or teaching materials to the linguistic
background of the students.

Limitations and further improvement
-----------------------------------
A first limitation comes in the actual appropriateness of the random questions
generated. While usually good enough, it is not rare that the system will
generate options that are easily ruled out by common sense, or even absurd. For
example, it is not uncommon to have an option generated where a group is said to
evolve from a more modern one, or to have impossible orderings of geological
periods in an interval. This is because the random generation used only takes
into account linguistic appropriateness, not logical one. For that, a different
logic should be written into the abstract syntax, or even an external "brain" used.

More specific and solvable limitations come with concrete syntax. On one hand,
it would be useful to add a way of expressing times which could use numbers. For
example, a well-known date is that Dinosaurs became extinct 65 million years
ago. A way of solving this would just be adding some Abstract dates, which would
just happen to be expressed in numbers. However, this is what geological period
names are for, and it would not allow the kind of expressiveness that numbers
give.

Another very obvious limitation is concerned with punctuation, which dictates
that the first letter in a sentence be upper case, and contractions in the
Spanish concrete syntax. In Spanish, the bigrams _a el_ and _de el_ have to be
contracted into _al_ and _del_. Failing to do this actually makes the sentence
incorrect, even if understandable, and the Paleontological Quiz grammar is
unable to do so. With further study of the GF resources and book this could
probably be solved.

Finally, the actual implementation of the quiz could be improved substantially.
Adding a graphical interface, or one more permissive with the user, would be
good additions. On top of that, a native implementation in maybe Haskell, C or
Javascript, which could also use the GF libraries for those languages, would
definetely improve on the current glue of scripting bash + invocations to the GF
shell.


---

Coursework for Advanced Issues in LCT/Multilingual Computing  
HLST master, LCT Programme, University of Malta  
Antonio F. G. Sevilla <antonio@garciasevilla.com>  
13 July 2015

<meta charset="UTF-8"></meta>
<link href="http://kevinburke.bitbucket.org/markdowncss/markdown.css" rel="stylesheet"></link>
