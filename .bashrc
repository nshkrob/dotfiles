export PS1='\n[$?]:\[\033[1;36m\]\t-\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\n\$ '

# PROMPT_COMMAND='echo -ne "\033]0;${PWD}\007"'

# In case .inputrc doesn't get read.
bind "set show-all-if-ambiguous on"


export EDITOR='vim'



# OSX only?
export CLICOLOR=1
export LSCOLORS=exfxcxdxbxexexabagacad


export TERM=xterm

# http://www.gnu.org/software/grep/manual/grep.html#Environment-Variables
# Works for GNU grep only.
export GREP_COLORS=ne

source ~/.bash_aliases

export PATH=/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/vmware/appcatalyst/bin:$PATH

export PATH=$HOME/code/ops/onebox/bin/:$PATH
