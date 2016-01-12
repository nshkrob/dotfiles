alias init='source ~/.bashrc'
alias i='init'
# alias ls='ls -G --color=auto'
alias ll='ls -lah'
alias l='ll'
alias lh='l -t | head'
alias '..'='cd ..'
alias '...'='cd ../..'
alias '....'='cd ../../..'
alias '.....'='cd ../../../..'
alias pd='pushd .'
# Colored less
alias less='less -R'
# Colored grep
# Correct grep version - GNU 2.15. bsd doesn't do colors right.
alias grep='/usr/local/bin/grep --colour=auto'
alias g-='grep -v'
alias gv='grep -v'
# Find
alias fin='find . -name'
# Make executable
alias cx='chmod +x'
# Careful!
alias mv='mv -i'
alias cp='cp -i'
alias cutt='cut -d " " -f '

# Demangle C++ symbols
alias nm='nm -C'
# Show dynamic symbols too.
alias nmd='nm -D'

# Installing/uninstalling
alias smi='sudo make install'   # WARNING: there is a package called smi.
alias smu='sudo make uninstall'

# Killing things
alias ki='killall -i'
alias k9='killall -9 -i'

#git
alias g='git'
alias gd='git diff'
alias gdc='git diff --cached --color=auto'
alias gds='gd --stat'
# Ignore untracked files
alias gs='git status -uno'
alias gr='git grep -n --color=auto'
alias ga='git add'
alias gaf='git add -f'
alias gau='git add -u'
alias gc='git commit'
alias gca='git commit -a'
alias gl='git log'
alias gl1='git log -1'
alias gl2='git log -2'
alias gl3='git log -3'
alias gl4='git log -4'
alias gl5='git log -5'
alias gl6='git log -6'
alias gl7='git log -7'
alias gl8='git log -8'
alias gl9='git log -9'
alias gl10='git log -10'
alias glo='git log --pretty=oneline'
# Parse author name.
alias gla="gl --pretty=format:'%an'"
alias gb='git branch'
alias gw='git whatchanged'
alias gco='git checkout'
alias gci='gc -m "Incoming"'
alias gcai='gca -m "Incoming"'
alias gcia='gcai'
alias gitinit='git init && ga . && gc -m "Initial commit."'
alias gh='git help -w'
alias gk='gitk --all &'
alias grm='git rm'
alias gcp='git cherry-pick'
alias gpr='git pull --rebase'
alias gp='git push'
# Go to git root.
alias groot='cd $(git rev-parse --show-toplevel)'
alias grh='git reset HEAD'
alias gre='git remote -v'

alias mktags='find . -name "*cpp" -o -name "*cxx" -o -name "*.hh" -o -name "*.h" -o -name "*.icc" | xargs etags --extra=+q --language-force=c++'
alias pytags='find . -name "*py" | xargs /usr/local/bin/etags --extra=+q'

alias pdb='python -m pdb'
alias pyserve='python -m SimpleHTTPServer'

# GNU coreutils
alias realpath=grealpath

# need sudo on osx
alias h='sudo htop'
