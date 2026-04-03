*My first aprouch tring to solve the problem*
# Problem: Visual Studio Code git gutter not working.

> Is local user problem(try whith diferent user)? NO
> Is source problema(try diferent versions)? NO
> Is system problem(change the operational system)? YES

## Problem root:
When installing vscode with rpm, create files that are not excluded from the system when remove the visual studio code package.
Result: Package managers are not good at all.

## Solution:
Format the system to solve the problem, and use full system backup routines, to prevent cases like this.

*After format my computer. I discover the real problem*

The Bug!
Visual Studio Code have a bug, they can't check realtime git modifications throw symbolic linked folders.

Why just visual studio code have this problem?

*The correct aprouch to solve this problem*

> Check one by one of my last environment changes

*Learnig across this issue*

Use less root.
