#!/bin/bash

set -e

failure(){
    echo " Failed at line number : $1 and command which got error is : $2 "
    }

   trap 'failure ${LINENO} "$BASH_COMMAND" ' ERR

   yum install git -y
   yum install mysqlll -y