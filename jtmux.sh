#!/bin/sh
tmux new-session \; \
  split-window -h -p 40 \; \
  select-pane -t 1 \; \
  split-window -v \; \
