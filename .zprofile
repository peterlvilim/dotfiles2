[ -f ~/id_rsa ] && eval `ssh-agent` > /dev/null
[ -f ~/id_rsa.pub ] && ssh-add 2> /dev/null
export LANG=en_US.UTF-8
export PATH=$PATH:/home/pvilim/.bin
if [ -z $SSH_CLIENT ] && [ -z $DISPLAY ]; then
    startx
fi
