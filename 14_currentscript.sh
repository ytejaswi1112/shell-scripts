#!/bin/bash
COURSE="Devops from current script"
echo "Before calling other script, course: $COURSE"
echo "Process id of current script : $$"
./15_otherscript.sh
echo "After calling other script , course: $COURSE"

