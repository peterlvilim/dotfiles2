Make new:
git init --bare $HOME/.myconf
alias config='/usr/bin/git --git-dir=$HOME/.myconf/ --work-tree=$HOME'
config config status.showUntrackedFiles no

Put on new machine:
git clone --separate-git-dir=$HOME/.myconf /path/to/repo $HOME/myconf-tmp
cp ~/myconf-tmp/.gitmodules ~  # If you use Git submodules
rm -r ~/myconf-tmp/
alias config='/usr/bin/git --git-dir=$HOME/.myconf/ --work-tree=$HOME'
