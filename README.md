# PL0-Parser
Group 11 homework 3


EBNF of PL/0
program ::= <block> "."
block   ::= <const-declaration> <var-declaration> <proc-declaration> <statement>
const-declaration ::= [ “const” <ident> “=” <number> {“,” <ident> “=" <number>} “;”]
var-declaration   ::= [ “var” <ident> { “,” <ident> } “;” ]
proc-declaration  ::= { "procedure" <ident> ";" <block> }
statement         ::= [ <ident> “:=" <expression>
                       | “begin” <statement> { “;” <statement> } “end”
                       | "call" <ident> ";"
                       | “if” <condition> “then” <statement> [ "else" <statement> ]
                       | “while” <condition> “do” <statement>
                       | “read” <ident>
                       | “write” <ident> ]
condition         ::= “odd” <expression>
                       | <expression>  <rel-op>  <expression>
rel-op            ::= "=" | "<>" | "<" | "<=" | ">" | ">=" 
expression        ::= [ “+” | “-” ] <term> { (“+” | “-”) <term> }
term              ::= <factor> { ( “*” | “/” ) <factor> }
factor            ::= <ident> | <number> | “(” <expression> “)”
number and ident are tokens with semantic values.
number            ::= <digit> {<digit>}
ident             ::= <letter> {<letter> | <digit>} 
digit             ::= “0” | “1” | “2” | “3” | “4” | “5” | “6” | “7” | “8” | “9”
letter            ::= “a” | “b” | ... | “y” | “z” | “A” | “B” | ... | “Y” | “Z”

Changes:
Line 7  : Block includes <proc-declaration> non-terminal symbol now
Line 10 : proc-declaration nonterminal symbol grammar. Calles block. Every time you enter this increase lex level by 1, before you leave decrease lex level by 1. Completely optional, but can have many procedures in one block.
line 13 : call procedure option added.
line 14 : else added to if statements. Actual grammar here is speculated and the professor may alter it. Understand that he's still working on removing "ambiguity" of nested else statements.
