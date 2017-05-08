Make new:  
git init --bare $HOME/.myconf  
alias config='/usr/bin/git --git-dir=$HOME/.myconf/ --work-tree=$HOME'  
config config status.showUntrackedFiles no  
  
Put on new machine and backup current config
curl -Lks https://gist.githubusercontent.com/peterlvilim/c83146cc196d1c73070ae35448a561d6/raw/44c0529f9ecbffdad2c68485a4224c11c782eae1/gistfile1.txt | /bin/bash
