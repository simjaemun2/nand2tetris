from projects.src08.vmconfig import *
from projects.src08.parser import *
from projects.src08.codewriter import *


import sys

'''
if len(sys.argv) < 2:
    print("There is no path of filename")
    exit(1)
'''
root_path = '/Users/a1/Desktop/nand2tetris/projects/08'
dirname = "FunctionCalls"
filename = "StaticsTest"
codewriter = CodeWriter('%s/%s/%s/%s.asm' % (root_path, dirname, filename, filename))
sys_parser = Parser('%s/%s/%s' % (root_path, dirname, filename), 'Sys')
class1_parser = Parser('%s/%s/%s' % (root_path, dirname, filename), 'Class1')
class2_parser = Parser('%s/%s/%s' % (root_path, dirname, filename), 'Class2')
parser_list = [class1_parser, class2_parser, sys_parser]

for parser in parser_list:
    codewriter.set_parser_filename(parser.get_filename())
    while parser.has_more_commands():
        parser.advance()

        #for debug
        codewriter.write_cur_command("\n// " + " ".join(parser.cur_command_token))

        command_type = parser.get_command_type()

        if command_type.value == CommandType.C_ARITHMETIC.value:
            codewriter.write_arithmetic(parser.get_arith())

        elif command_type.value == CommandType.C_PUSH.value or command_type.value == CommandType.C_POP.value:
            codewriter.write_push_pop(command_type, parser.get_arg1(), parser.get_arg2())

        elif command_type.value == CommandType.C_LABEL.value:
            codewriter.write_label(parser.get_arg1())

        elif command_type.value == CommandType.C_IF.value:
            codewriter.write_if(parser.get_arg1())

        elif command_type.value == CommandType.C_GOTO.value:
            codewriter.write_goto(parser.get_arg1())

        elif command_type.value == CommandType.C_FUNCTION.value:
            codewriter.write_function(parser.get_arg1(), parser.get_arg2())

        elif command_type.value == CommandType.C_RETURN.value:
            codewriter.write_return()

        elif command_type.value == CommandType.C_CALL.value:
            codewriter.write_call(parser.get_arg1(), parser.get_arg2())

codewriter.close()

