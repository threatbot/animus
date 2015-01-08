#!/bin/bash

grep -r `~/dev/code/date.py` ~/data/logs/*/ ~/legacy/research/logs/*/ | grep 'login attempt' | cut -d']' -f2 | cut -d'[' -f2 | cut -d'/' -f2
