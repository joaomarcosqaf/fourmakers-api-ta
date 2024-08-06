import sys
import os
from os import path

sys.path.append(path.abspath('./'))

commands = {
    "-all": "robot -d ./logs src/test",
}

for param in sys.argv[1:]:
    if param in commands:
        command = commands[param]
    else :
        print(f"Parâmetro inválido ou inexistente: {param}")

os.system(command)