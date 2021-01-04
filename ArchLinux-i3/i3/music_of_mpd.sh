#!/bin/bash

info=`mpc -f %artist%-%title% |head -n 1`

echo " $info"
