# i3 Key Check
When editing i3 keybindings, cleaning up conflicts can be a hard thing to do. i3 will give you only bare bones info to solve conflicts. This script should give much more detailed info when there are conflicts in your config.

## Installation
Installation should be simple. The only dependency is the ruby programming language. Once you have that, you can clone the repository and run the script as an executable.

## Examples

If you have a conflict(s), it should look something like this:
```
Conflict 1 ($mod+n):
line number 20: bindsym $mod+n border normal
line number 21: bindsym $mod+n border pixel 2
Conflict 2 ($mod+d):
line number 36: bindsym $mod+d exec --no-startup-id dmenu_recency
line number 37: bindsym $mod+d exec --no-startup-id chromium
```
If you don't have a conflict, it should look like this:
```
Your keybindings are conflict free! :)
```
**NOTE:** This is a new repo and script, so it can be buggy and might not be compatible with all configs.
