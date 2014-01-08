dotfiles
========
These are my dotfiles!


github setup
------------

From https://help.github.com/articles/generating-ssh-keys

To set up a new machine:

Generate a new private/public keypair.

Upload public key to Github using https://github.com/settings/ssh

Verify the ssh key works by:

    ssh -T git@github.com

Cloning should be done by ssh to be able to push:

    git remote set-url origin git@github.com:username/repo.git

OR

    git clone git@github.com:username/repo.git

(how does it know the username?? Looks like by the public key)

