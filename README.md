# scripts-and-configs
Collections of different scripts and configs that make my life easier.

A lot of this is code I've found in forums that I've adapted to my use cases.

## Bash

To make .bash_aliases and .bash_functions work, I add the following to .bashrc

```bash
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

if [ -f ~/.bash_functions ]; then
    . ~/.bash_functions
fi
```

## PowerShell

If the profile is not already created use the following command to create it.

```powershell
if (!(Test-Path -Path $PROFILE)) {
  New-Item -ItemType File -Path $PROFILE -Force
}
```

If using the newer PowerShell 7.x move profile to following folder:

```powershell
$HOME\Documents\PowerShell\
```
