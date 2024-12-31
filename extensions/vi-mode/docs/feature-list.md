# vi-mode Feature List
## Table of Contents
- [[#Overview|Overview]]
	- [[#Overview#Status Legend|Status Legend]]
- [[#Movement Commands|Movement Commands]]
- [[#Cursor Movement|Cursor Movement]]
- [[#Insert mode - inserting/appending text|Insert mode - inserting/appending text]]
- [[#Editing|Editing]]
- [[#Operators|Operators]]
	- [[#Operators#Description|Description]]
		- [[#Description#Modifier|Modifier]]
		- [[#Description#Motion|Motion]]
	- [[#Operators#Double Count|Double Count]]
	- [[#Operators#Visual Mode|Visual Mode]]

## Overview

This page aims to capture all vi/vim features, and whether they have been implemented in Lem's vi-mode. A feature should be ticked off here when it is added.

The categories and commands were taken from this (Vim Help Reference)[https://vimhelp.org/usr_03.txt.html#03.1]. It is not entirely complete but is a very good feature list to copy for now. I have added some more that I use.
Later the below list can be enrich from the (Vim Docs Index)[https://vimdoc.sourceforge.net/htmldoc/vimindex.html] but that is much more complex.

With the Ctrl keys, check that they only affect the correct mode, and do not interfere with Lem's keybindings.

### Status Legend

| Value | Description             |
| ----- | ----------------------- |
| y   | implemented             |
| n   | not implemented         |
| /   | somewhat implemented    |
| x   | will not be implemented |
| n/a | not available           |
| ?   | unknown                 |

## Movement Commands

| Status      | Key | Command                      | Notes                      | Count Prefix                                     |
| ----------- | --- | ---------------------------- | -------------------------- | ------------------------------------------------- |
| *Char/Word* |     |                              |                            |                                                   |
| y           | h   | Left                         | [ ] `set whichwrap`        |                                                   |
| y           | j   | Down                         |                            |                                                   |
| y           | k   | Up                           |                            |                                                   |
| y           | l   | Right                        |                            |                                                   |
| y           | gj  | Inner Line Down              | For when a line is wrapped |                                                   |
| y           | gk  | Inner Line Up                | For when a line is wrapped |                                                   |
| y           | w   | word                         |                            |                                                   |
| y           | W   | BroadWord                    |                            |                                                   |
| y           | e   | End of word                  |                            |                                                   |
| y           | E   | End of BroadWord             |                            |                                                   |
| y           | E   | End of BroadWord             |                            |                                                   |
| y           | ge  | End of prev word             |                            |                                                   |
| y           | gE  | End of prev BroadWord        |                            |                                                   |
| *Line*      |     |                              |                            |                                                   |
| y           | 0   | Start of line                |                            |                                                   |
| ?           | _   | Start of line                |                            |                                                   |
| y           | ^   | First non-blank char on line |                            |                                                   |
| y           | $   | End of line                  |                            | Should go the end of of nth line from current pos |
| ?           | g_  | End of line                  |                            |                                                   |

## Cursor Movement

| Status       | Key      | Command                                                           | Notes                                        | Count Prefix                                      | Vim Settings     |     |     |
| ------------ | -------- | ----------------------------------------------------------------- | -------------------------------------------- | ------------------------------------------------- | ---------------- | --- | --- |
| *Basic*      |          |                                                                   |                                              |                                                   |                  |     |     |
| y            | h        | move cursor left                                                  |                                              | y                                                 | [ ] `whichwrap`  |     |     |
| y            | j        | move cursor down                                                  |                                              | y                                                 |                  |     |     |
| y            | k        | move cursor up                                                    |                                              | y                                                 |                  |     |     |
| y            | l        | move cursor right                                                 |                                              | y                                                 |                  |     |     |
| y            | gj       | move cursor down (multi-line text)                                |                                              | y                                                 |                  |     |     |
| y            | gk       | move cursor up (multi-line text)                                  |                                              | y                                                 |                  |     |     |
| ?            | H        | move to top of screen                                             |                                              |                                                   |                  |     |     |
| ?            | M        | move to middle of screen                                          |                                              |                                                   |                  |     |     |
| ?            | L        | move to bottom of screen                                          |                                              |                                                   |                  |     |     |
| y            | w        | jump forwards to the start of a word                              |                                              |                                                   |                  |     |     |
| y            | W        | jump forwards to the start of a punctuation word                  |                                              |                                                   |                  |     |     |
| y            | e        | jump forwards to the end of a word                                |                                              |                                                   |                  |     |     |
| y            | E        | jump forwards to the end of a punctuation word                    |                                              |                                                   |                  |     |     |
| y            | b        | jump forwards to the start of a word                              |                                              |                                                   |                  |     |     |
| y            | B        | jump forwards to the start of a punctuation word                  |                                              |                                                   |                  |     |     |
| ?            | ge       | jump backwards to the end of a word                               |                                              |                                                   |                  |     |     |
| ?            | gE       | jump backwards to the end of a punctuation word                   |                                              |                                                   |                  |     |     |
| y            | %        | move cursor to matching character                                 | Default: (), {}, [], ", '                    |                                                   | [ ] `matchpairs` |     |     |
| ?            | 0        | jump to the start of the line                                     |                                              |                                                   |                  |     |     |
| ?            | ^        | jump to the first non-blank character of the line                 |                                              |                                                   |                  |     |     |
| ?            | $        | jump to the end of the line                                       |                                              | Should go the end of of nth line from current pos |                  |     |     |
| *g Commands* |          |                                                                   |                                              |                                                   |                  |     |     |
| ?            | g_       | jump to the last non-blank character of the line                  |                                              | Goes to line n                                    |                  |     |     |
| y            | gg       | go to the first line of the document                              |                                              | Goes to line n                                    |                  |     |     |
| y            | G        | go to the last line of the document                               |                                              |                                                   |                  |     |     |
| ?            | gd       | move to local declaration                                         |                                              | n/a                                               |                  |     |     |
| ?            | gD       | move to global declaration                                        |                                              | n/a                                               |                  |     |     |
| ?            | gi       | move to local declaration                                         |                                              | n/a                                               |                  |     |     |
| *Find*       |          |                                                                   |                                              |                                                   |                  |     |     |
| y            | f{char}  | jump to next occurrence of character                              |                                              | y                                                 |                  |     |     |
| y            | t{char}  | jump to before next occurrence of character                       |                                              | y                                                 |                  |     |     |
| y            | F{char}  | jump to the previous occurrence of character                      |                                              | y                                                 |                  |     |     |
| y            | T{char}  | jump to after previous occurrence of character                    |                                              | y                                                 |                  |     |     |
| y            | ;        | repeat previous f, t, F or T movement                             |                                              | y                                                 |                  |     |     |
| y            | ,        | repeat previous f, t, F or T movement backwards                   |                                              |                                                   |                  |     |     |
| y            | }        | jump to next paragraph (or function/block, when editing code)     |                                              | y                                                 |                  |     |     |
| y            | {        | jump to previous paragraph (or function/block, when editing code) |                                              | y                                                 |                  |     |     |
| y            | z{char}  | center cursor on screen                                           |                                              |                                                   |                  |     |     |
| y            | z{char}  | position cursor on top of the screen                              |                                              |                                                   |                  |     |     |
| y            | z{char}  | position cursor on top of the screen                              | Lem seems to obey some scrolloff             |                                                   |                  |     |     |
| *Ctrl Keys*  |          |                                                                   |                                              |                                                   |                  |     |     |
|              | Ctrl + e | move screen down one line (without moving cursor)                 |                                              |                                                   |                  |     |     |
|              | Ctrl + y | move screen up one line (without moving cursor)                   | Careful to allow pasting in certain contexts |                                                   |                  |     |     |
|              | Ctrl + b | move screen up one page (cursor to last line)                     |                                              |                                                   |                  |     |     |
|              | Ctrl + f | move screen down one page (cursor to first line)                  |                                              |                                                   |                  |     |     |
| /            | Ctrl + d | move cursor and screen down 1/2 page                              | Count prefix not implemented                 | [ ] Currently does not accept count prefix        |                  |     |     |
| /            | Ctrl + u | move cursor and screen up 1/2 page                                | Count prefix not implemented                 | [ ] Currently does not accept count prefix        |                  |     |     |

## Insert mode - inserting/appending text

| Status | Key            | Command                                                                    | Notes                           | Number Prefix   | Vim Settings |
| ------ | -------------- | -------------------------------------------------------------------------- | ------------------------------- | --------------- | ------------ |
| /      | i              | insert before the cursor                                                   |                                 | Not implemented |              |
| /      | I              | insert at the beginning of the line                                        |                                 | Not implemented |              |
| /      | a              | insert (append) after the cursor                                           |                                 | Not implemented |              |
| /      | A              | insert (append) at the end of the line                                     |                                 | Not implemented |              |
| /      | o              | append (open) a new line below the current line                            |                                 | Not implemented |              |
| /      | O              | append (open) a new line above the current line                            |                                 | Not implemented |              |
| n      | Ctrl + h       | delete the character before the cursor during insert mode                  |                                 |                 |              |
| n      | Ctrl + w       | delete word before the cursor during insert mode                           |                                 |                 |              |
| y      | Ctrl + j       | add a line break at the cursor position during insert mode                 |                                 |                 |              |
| n      | Ctrl + t       | indent (move right) line one shiftwidth during insert mode                 |                                 |                 |              |
| n      | Ctrl + d       | de-indent (move left) line one shiftwidth during insert mode               |                                 |                 |              |
| n      | Ctrl + n       | insert (auto-complete) next match before the cursor during insert mode     | C-p is implemented but not this |                 |              |
| y      | Ctrl + p       | insert (auto-complete) previous match before the cursor during insert mode |                                 |                 |              |
| n      | Ctrl + r {reg} | insert the contents of register                                            |                                 |                 |              |
| n      | Ctrl + o {cmd} | Temporarily enter normal mode to issue one normal-mode command { cmd }.    |                                 |                 |              |
| y      | Esc            | exit insert mode                                                           |                                 | n/a             |              |
| x      | Ctrl+c         | exit insert mode                                                           | Do not bind in Lem              | n/a             |              |

## Editing

| Status | Key        | Command                                                      | Notes                             | Number Prefix | Vim Settings |
| ------ | ---------- | ------------------------------------------------------------ | --------------------------------- | ------------- | ------------ |
| y      | r          | replace a single character.                                  | [ ] C-e + C-y behaviour. See :h r | y             |              |
| n      | R          | replace more than one character, until ESC is pressed.       |                                   |               |              |
| y      | J          | join line below to the current one with one space in between |                                   | y             |              |
| y      | gJ         | join line below to the current one without space in between  |                                   | y             |              |
| n      | gwip       | reflow paragraph                                             |                                   | n             |              |
| y      | g~{motion} | switch case up to motion                                     |                                   | y             |              |
| y      | gu         | change to lowercase up to motion                             |                                   | y             |              |
| y      | gU         | change to uppercase up to motion                             |                                   | y             |              |
| y      | cc         | change (replace) entire line                                 |                                   | y             |              |
| y      | c$ or C    | change (replace) to the end of the line                      |                                   | y             |              |
| y      | s          | delete character and substitute text (same as cl)            |                                   | y             |              |
| y      | S          | delete line and substitute text (same as cc)                 |                                   | y             |              |
| y      | u          | undo                                                         |                                   | y             |              |
| n      | U          | restore (undo) last changed line                             |                                   |               |              |
| y      | Ctrl + r   | redo                                                         |                                   | y             |              |
| y      | .          | repeat last command                                          |                                   | y             |              |

## Operators

### Description

Operators are split into the form:
```
{optional count} {command} {optional count} {optional modifier} {motion}
```

#### Modifier

This is optional and will be either `i` or `a`, meaning in or around.
Depending on the modifier or the exclusion of it, the text objects will have different behaviour

#### Motion

This will be key representing a text object. A lot of these are implemented for basic movement. They have different behaviour based on whether the modifier used. 

| Status | Keys | Text Object          | Lem Only | Notes |
| ------ | ---- | -------------------- | -------- | ----- |
| y      | w    | word                 |          |       |
| y      | W    | broad word           |          |       |
| y      | b    | back word            |          |       |
| y      | B    | back broad word      |          |       |
| y      | e    | end of word          |          |       |
| y      | E    | end of broad word    |          |       |
| y      | E    | end of broad word    |          |       |
| y      | E    | end of broad word    |          |       |
| y      | :    | to line num          |          |       |
| y      | gg/G | to start/end of file |          |       |
| n      | p    | paragraph            |          |       |
|        |      |                      |          |       |

### Double Count

Both counts should be allowed, eg. `3dw` or `d3w`.
In vim, these can be combined to have `2d3w` to delete 6 words.

### Visual Mode

When in visual mode, repeating: `{optional count} {command} {optional count} {motion}` should extend the visual mode.
Eg. `vib` -> `2ib` should highlight inside 3 pairs of brackets. More can then be chained on again. This should extend to all text objects.


