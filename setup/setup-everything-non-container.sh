#!/bin/bash

#this scripts sets up everything in a Linux
#use when setting up non-container Linux
#typically used just after fresh install of RHEL-based Linux
set -e 

cdir=$(pwd)
cd both

#execute all setup scripts
ls -1 *sh | awk '{print "sh -e " $1}' | sh

cd $cdir
cd non-container

#execute each '2*sh' script 
ls -1 *sh | awk '{print "sh -e " $1}' | sh
