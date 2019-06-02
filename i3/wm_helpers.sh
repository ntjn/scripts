#!/bin/bash

get_workspace_name() {
    i3-msg -t get_workspaces|jq ".[]|select(.num == $1)|.[\"name\"]"|sed -r 's/"//g'
}

get_desktop_id() {
    c=0
    for i in $(xprop -root _NET_DESKTOP_NAMES|sed 's/[^"]*//;s/,//g');do
        [[ ${i:1:-1} != $1 ]] && \
            c=$[$c+1] || \
            break
    done
    echo $c
}

get_window_ids() {
    xdotool search --all --desktop $1 ''
}

get_window_class() {
    xprop -id $1 WM_CLASS|rev|sed -r 's/"([^"]*).*/\1/'|rev
}

rename() {
    i3-msg "rename workspace \"$1\" to \"${2,,}\""
}
