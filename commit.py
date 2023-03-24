#!/usr/bin/python3
# -*- coding: utf-8 -*-
import subprocess
from os import system
from sys import argv
def command(command): 
    result = subprocess.run(command, stdout=subprocess.PIPE)
    return result.stdout.decode('utf-8')
def shell(commands):
    for command in commands:
        system(command)
branch = command(['git', 'branch', '--show-current']).strip()
shell(['clear'])
argument = argv[1]
commit = f'{branch}, {argument}'
commit_command = command(['git', 'commit', '-am', commit]).strip().split('\n')[1]
commit_output = commit_command.split(', ')
colors = ['\033[96m', '\033[92m', '\033[91m']
commit_text_print = ''
for key, element in enumerate(commit_output):
    if key != 0:
        commit_text_print += ', '
    commit_text_print += f'{colors[key]}{element}'
    
print(commit_text_print)