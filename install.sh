set -ex

here="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

ln -s $here/.bashrc ~
ln -s $here/.bash_aliases ~
ln -s $here/.emacs ~
ln -s $here/.gitconfig ~
