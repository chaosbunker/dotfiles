# .bashrc
if [[ $- != *i* ]] ; then
  # shell is non-interactive. be done now!
  return
fi

source ~/.bash_prompt

# Load all files from .shell/rc.d directory
if [ -d $HOME/rc.d ]; then
  for file in $HOME/rc.d/*; do
    source $file
  done
fi

# Append to the Bash history file, rather than overwriting it.
shopt -s histappend

# Enable some Bash 4 features when possible:
# * `autocd`, e.g. `**/qux` will enter `./foo/bar/baz/qux`
# * Recursive globbing, e.g. `echo **/*.txt`
for option in autocd globstar; do
	shopt -s "$option" 2> /dev/null
done

if [ -f $(brew --prefix)/etc/bash_completion ]; then
  . $(brew --prefix)/etc/bash_completion
fi

# Add tab completion for SSH hostnames based on ~/.ssh/config, ignoring wildcards.
[ -e "$HOME/.ssh/config" ] && complete -o "default" -o "nospace" -W "$(grep "^Host" ~/.ssh/config | grep -v "[?*]" | cut -d " " -f2 | tr ' ' '\n')" scp sftp ssh

# Add tab completion for `defaults read|write NSGlobalDomain`
# You could just use `-g` instead, but I like being explicit
complete -W "NSGlobalDomain" defaults

# Add `killall` tab completion for common apps
complete -o "nospace" -W "Contacts Calendar Dock Finder Mail Safari iTunes SystemUIServer Terminal" killall

# If possible, add tab completion for many more commands
[ -f /etc/bash_completion ] && source /etc/bash_completion
command -v brew >/dev/null 2>&1 && [ -f $(brew --prefix)/etc/bash_completion ] && . $(brew --prefix)/etc/bash_completion

# Autocorrect typos in path names when using `cd`.
shopt -s cdspell

# Case-insensitive globbing (used in pathname expansion).
shopt -s nocaseglob

# Allow use to re-edit a faild history substitution.
shopt -s histreedit

# History expansions will be verified before execution.
shopt -s histverify

# Give history timestamps.
export HISTTIMEFORMAT="[%F %T] "

# Check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# Return true so first prompt uses 0 as last exit code
true

