#!/bin/bash
ddcutil getvcp 10 | awk '/current value/ {print $9}' | sed 's/,//'
