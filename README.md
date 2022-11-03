# scripts-and-configs
Collections of different scripts and configs that make my life easier.

A lot of this is code I've found in forums that I've adapted to my use cases.

To make .bash_aliases and .bash_functions work, I add the following to .bashrc

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

if [ -f ~/.bash_functions ]; then
    . ~/.bash_functions
fi
