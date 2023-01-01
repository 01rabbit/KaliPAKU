#!/bin/bash

    tmux new-session -d -s 'kp'
    tmux split-window -v -p 30
    tmux select-pane -t 0
    # tmux split-window -h -p 66
    # tmux split-window -h -p 50
    # tmux split-pane -t 1
    cmd="crackmapexec smb 172.16.3.12"
    tmux send-keys -t 1 "${cmd};read;exit" C-m
    tmux set-option -g mouse on
    tmux attach -t kp
    echo test
