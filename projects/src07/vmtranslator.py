from projects.src07.vmconfig import *
from projects.src07.parser import *
from projects.src07.codewriter import *


import sys

'''
if len(sys.argv) < 2:
    print("There is no path of filename")
    exit(1)
'''
dirname = "MemoryAccess"
filename = "StaticTest"
codewriter = CodeWriter('/Users/a1/Desktop/nand2tetris/projects/07/%s/%s/%s.asm' % (dirname, filename, filename), filename)
parser = Parser('/Users/a1/Desktop/nand2tetris/projects/07/%s/%s/%s.vm' % (dirname, filename, filename))

while parser.has_more_commands():
    parser.advance()

    #for debug
    codewriter.write_cur_command("\n// " + " ".join(parser.cur_command_token))

    command_type = parser.get_command_type()

    if command_type == CommandType.C_ARITHMETIC:
        codewriter.write_arithmetic(parser.get_arith())
    elif command_type == CommandType.C_PUSH or CommandType.C_POP:
        codewriter.write_push_pop(command_type, parser.get_arg1(), parser.get_arg2())

codewriter.close()

