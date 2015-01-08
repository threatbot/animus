#!/bin/bash

grep -r "login attempt" ~/data/logs/*/ ~/legacy/research/logs/*/ | cut -d',' -f3 | cut -d']' -f1


