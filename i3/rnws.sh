#!/bin/bash

# Append WM_CLASS to the name of workspace if it isn't xterm

. $(dirname $0)/wm_helpers.sh

workspace_id=$1

set -eux

workspace_name=$(get_workspace_name $workspace_id)
desktop_id=$(get_desktop_id $workspace_name)
window_id=$(get_window_ids $desktop_id)
window_class=$(get_window_class $window_id)

[[ ${window_class,,} != 'xterm' ]] && \
    rename $workspace_name $workspace_id:$window_class

set +eux
