#!/bin/bash

grep -r "Remote SSH version" ~/data/logs/*/ ~/legacy/research/logs/*/ | cut -d' ' -f7
