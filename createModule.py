#!/usr/bin/python3
# -*- coding: utf-8 -*-
from os import path, makedirs, chdir, system
from random import randint

def create_module():
    server_path = './server/src/'
    server_existence = path.exists(server_path)
    if not server_existence:
        return print('Carpeta del servidor no encontrada')

    module_name = input("Nombre del módulo: ")
    endpoint = input("Endpoint: ")
    module_existence = path.exists(f'{server_path}{module_name}')

    if module_existence:
        return print('El módulo ya existe')

    chdir(server_path)
    makedirs(module_name)
    chdir(module_name)
    makedirs('specs')

    model_file = open(f'{module_name}.model.js', 'w')
    route_file = open(f'{module_name}.routes.js', 'w')
    module_file = open('module.js', 'w')
    testing_file = open(f'specs/{module_name}.spec.js', 'w')

    module_file.write(f"""
import routes from '../core/routes.js'
import {module_name}Routes from './{module_name}.routes.js'

export default (app) => {"{"}
    {module_name}Routes(app, routes)
{"}"}

""")

    route_file.write(f"""
import {module_name} from './{module_name}.model.js'

export default (app, abstractRoutes) => {"{"}
  const PATH = '/{endpoint}';

  const routes = abstractRoutes(app, {module_name}, PATH);

  routes.setup({"{"}

  {"}"});

  return routes;
{"}"};
""")  
 
    model_file.write(f"""
import mongoose from 'mongoose';
import abstractModel from '../core/model.js';   

const {endpoint}Schema = new mongoose.Schema(
  {"{"}
  
  {"}"},
  {"{"}collection: '{endpoint}'{"}"}
);

const {endpoint}Module = mongoose.model('{endpoint}', {endpoint}Schema);
const model = abstractModel({endpoint}Schema);

export default model;
""")


    testing_file.write(f"""
import testingRoutes from '../../utilsForSpecs/testingRoutes.js';
import {module_name}Routes from '../{module_name}.routes.js';

describe('Testing {module_name} routes', () => {"{"}
    const routes = testingRoutes({module_name}Routes);

    it('should return the correct path', () => {"{"}
        expect(routes.path).toBe('/{endpoint}');
    {"}"});

{"}"});
    """)



create_module()