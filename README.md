# [CS155] Problem Set 2 - Lexical Analyzer using Flex
A lexical analyzer for the `EASY` language

**To compile and run (using Windows)**
```
flex lexAnalyzer.lex
gcc lex.yy.c
./a.exe
```
Notes:
- Given an input, the program will output `< TOKEN, LEXEME >` pairs on the terminal.
- Token classification used and other info can be found in this [PDF](https://drive.google.com/file/d/1z1crxOoAW-Lb3gwQ3LMRYhbLP0bUUtip/view?usp=sharing)
- `LITERALS` classification was subclassified into the following:
  - `LITERAL_str`: string literal
  - `LITERAL_int`: integer literal
  - `LITERAL_bool`: boolean literal
- `OPERATOR` classification was subclassified into the following:
  - `ARITH_OPERATOR`: arithmetic operator 
  - `LOGI_OPERATOR`: logical operator
  - `REL_OPERATOR`: relational operator
- **If the user enters an incorrect input, the program will terminate abruptly.**

# Sample Test Case  
**Input:**
<p align = "center"> 
    <img src=".\image\procedure_invert_pseudocode.png" alt="image">
</p>

**Output:**
<p align = "center"> 
    <img src=".\image\procedure_invert.png" alt="image">
</p>

