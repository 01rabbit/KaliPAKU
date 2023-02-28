#!/bin/bash

source kp.conf
source $MODULES_PATH/misc_module.sh
# source kalipaku.sh

KP=$0

if [ -z ${TMUX} ];then
    # Banner
    clear
    banner
    read -t 1
    clear

    tmux new-session -d -s "${TITLE}" -n "Main"
    tmux set-option -g mouse on
    tmux bind-key -T copy-mode-vi y send-keys -X copy-pipe-and-cancel
    tmux bind-key -T copy-mode-vi Enter send-keys -X copy-pipe-and-cancel
    tmux send-keys -t "Main".0 "${KP}" C-m
    tmux send-keys -t "Main".0 "clear" C-m
    tmux -2 attach -t "${TITLE}"
else
    tmux split-window -v -p 25
    tmux send-keys "./assist.sh message;exit" C-m

    tmux select-pane -t 0
    tmux split-window -h -p 25
    tmux send-keys "./assist.sh menu;exit" C-m

    tmux select-pane -t 1
    sleep 1
    tmux send-keys "S1" C-m

    tmux select-pane -t 2

fi