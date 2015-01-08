#!/bin/bash

grep -r "login attempt" ~/data/logs/*/ ~/legacy/research/logs/*/ | cut -d']' -f2 | cut -d'[' -f2 | cut -d'/' -f2
