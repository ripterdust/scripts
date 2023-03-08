#!/usr/bin/python3
# -*- coding: utf-8 -*-
from os import path, makedirs, chdir, system
from random import randint

def create_module():
    server_path = './server/src/'
    server_existence = path.exists(server_path)
    
    if not server_existence:
        return print('Carpeta del servidor no encontrada')

    module_name = f'juanito-{randint(0, 100)}'

    module_existence = path.exists(f'{server_path}{module_name}')

    if module_existence:
        return print('El módulo ya existe')

    chdir(server_path)

    makedirs(module_name)

    chdir(module_name)

    



create_module()