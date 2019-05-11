from projects.src08.vmconfig import CommandType

TEMP_START = 5
THIS = 3
THAT = 4
ARG = 2
stack = []
commands = []
cmp_cnt = 0

class CodeWriter:
    def __init__(self, filepath):
        self.filepath = filepath
        self.filename = ""
        self.cur_function = ["bootstrap"]
        self.__writer_init()

    def set_parser_filename(self, filename):
        self.filename = filename

    def __append_command(self, command):
        commands.append(command)

    def __append_increase_SP(self):
        self.__append_command('@SP')
        self.__append_command('M = M + 1')

    def __append_first_SP(self):
        # SP = SP-1 and D = stack[SP]
        self.__append_command('@SP')
        self.__append_command('AM = M - 1')

    def __append_second_SP(self):
        # SP = SP - 1 and ready to get stack[sp]
        self.__append_command('@SP')
        self.__append_command('AM = M - 1')

    def __append_compare(self, jump_condition):
        global cmp_cnt
        self.__append_first_SP()
        self.__append_command('D = M')

        self.__append_second_SP()
        self.__append_command('D = M - D')
        # eq
        self.__append_command('@TRUE%d' % cmp_cnt)
        self.__append_command('D; %s' % jump_condition)
        # stack[SP] = 0 (false)
        self.__append_command('@SP')
        self.__append_command('A = M')
        self.__append_command('M = 0')

        self.__append_command('@END%d' % cmp_cnt)
        self.__append_command('0; JMP')

        self.__append_command('(TRUE%d)' % cmp_cnt)
        self.__append_command('@SP')
        self.__append_command('A = M')
        self.__append_command('M = -1')
        # end
        self.__append_command('(END%d)' % cmp_cnt)
        self.__append_increase_SP()
        cmp_cnt += 1

    def __append_2_args(self, oper):
        self.__append_first_SP()
        self.__append_command('D = M')

        self.__append_second_SP()
        self.__append_command('M = M %s D' % oper)
        self.__append_increase_SP()

    def __append_arg(self, oper):
        self.__append_first_SP()
        self.__append_command('M = %sM' % oper)
        self.__append_increase_SP()

    def write_arithmetic(self, arith):
        if arith == 'add':
            self.__append_2_args('+')

        elif arith == 'eq':
            self.__append_compare("JEQ")

        elif arith == 'lt':
            self.__append_compare("JLT")

        elif arith == 'gt':
            self.__append_compare("JGT")

        elif arith == 'sub':
            self.__append_2_args('-')

        elif arith == 'and':
            self.__append_2_args('&')

        elif arith == 'or':
            self.__append_2_args('|')

        elif arith == 'neg':
            self.__append_arg('-')

        elif arith == 'not':
            self.__append_arg('!')

    def __append_pop_not_constant(self, seg, index):
        # D = index
        self.__append_command('@' + str(index))
        self.__append_command('D = A')
        # LCL(seg) += index-th address
        self.__append_command('@%s' % seg)
        self.__append_command('A = M')
        self.__append_command('D = A + D')
        self.__append_command('@%s' % seg)
        self.__append_command('M = D')
        # SP-- and D = stack[SP]
        self.__append_first_SP()
        self.__append_command('D = M')
        # LCL index-th = D
        self.__append_command('@%s' % seg)
        self.__append_command('A = M')
        self.__append_command('M = D')
        # D = index
        self.__append_command('@' + str(index))
        self.__append_command('D = A')
        # LCL(seg) -= index-th address
        self.__append_command('@%s' % seg)
        self.__append_command('A = M')
        self.__append_command('D = A - D')
        self.__append_command('@%s' % seg)
        self.__append_command('M = D')

    def __append_push_to_stack(self):
        self.__append_command('@SP')
        self.__append_command('A = M')
        self.__append_command('M = D')

    def __append_push_not_constant(self, seg, index):
        # D = index
        self.__append_command('@' + str(index))
        self.__append_command('D = A')
        # LCL(seg) += index-th address
        self.__append_command('@%s' % seg)
        self.__append_command('A = M')
        self.__append_command('D = A + D')
        # D = index-th value
        self.__append_command('A = D')
        self.__append_command('D = M')

        self.__append_push_to_stack()
        self.__append_increase_SP()

    def write_push_pop(self, command, segment, index):
        if command.value == CommandType.C_PUSH.value:
            if segment == "constant":
                # load constant to A, and assign D = A
                self.__append_command('@' + str(index))
                self.__append_command('D = A')
                # load SP and stack[SP] = D
                self.__append_push_to_stack()
                self.__append_increase_SP()
            elif segment == "local":
                self.__append_push_not_constant('LCL', index)
            elif segment == "argument":
                self.__append_push_not_constant('ARG', index)
            elif segment == "this":
                self.__append_push_not_constant('THIS', index)
            elif segment == "that":
                self.__append_push_not_constant('THAT', index)
            elif segment == "temp": # temp has not predefined symbol
                self.__append_command('@%s' % (TEMP_START + index))
                self.__append_command('D = M')
                # load SP and stack[SP] = D
                self.__append_push_to_stack()
                self.__append_increase_SP()
            elif segment == "pointer":
                self.__append_command('@%s' % ('THIS' if index == 0 else 'THAT'))
                self.__append_command('D = M')
                self.__append_push_to_stack()
                self.__append_increase_SP()
            elif segment == "static":
                self.__append_command('@%s.%d' % (self.filename, index))
                self.__append_command('D = M')
                self.__append_push_to_stack()
                self.__append_increase_SP()

        elif command.value == CommandType.C_POP.value:
            if segment == "constant":
                ":"
            elif segment == "local":
                self.__append_pop_not_constant('LCL', index)
            elif segment == "argument":
                self.__append_pop_not_constant('ARG', index)
            elif segment == "this":
                self.__append_pop_not_constant('THIS', index)
            elif segment == "that":
                self.__append_pop_not_constant('THAT', index)
            elif segment == "temp":# temp has not predefined symbol
                self.__append_second_SP()
                self.__append_command('D = M')
                # temp[index] = D
                self.__append_command('@%d' % (index + TEMP_START))
                self.__append_command('M = D')
            elif segment == "pointer":
                self.__append_first_SP()
                self.__append_command('D = M')
                self.__append_command('@%s' % ('THIS' if index == 0 else 'THAT'))
                self.__append_command('M = D')
            elif segment == "static":
                self.__append_first_SP()
                self.__append_command('D = M')
                self.__append_command('@%s.%d' % (self.filename, index))
                self.__append_command('M = D')

    def write_cur_command(self, command):
        commands.append(command)

    def __writer_init(self):
        self.__append_command('@256')
        self.__append_command('D = A')
        self.__append_command('@SP')
        self.__append_command('M = D')
        self.write_call('Sys.init', 0)
        #self.__append_command('@Sys.init')
        #self.__append_command('0;JMP')

    def write_label(self, label):
        cur_label = '%s$%s' % (self.cur_function[-1], label)
        self.__append_command('(%s)' % cur_label)

    def write_if(self, label):
        cur_label = '%s$%s' % (self.cur_function[-1], label)
        self.__append_first_SP()
        self.__append_command('D = M')
        self.__append_command('@%s' % cur_label)
        self.__append_command('D;JNE')

    def write_goto(self, label):
        cur_label = '%s$%s' % (self.cur_function[-1], label) if label != "Sys.init" else label
        self.__append_command('@%s' % cur_label)
        #self.__append_command('@%s' % label)
        #self.__append_command('A = M')
        self.__append_command('0;JMP')

    def write_function(self, function_name, num_args):
        self.__append_command('(%s)' % function_name)
        self.cur_function.append(function_name)
        for i in range(num_args):
            self.__append_command('@SP')
            self.__append_command('A = M')
            self.__append_command('M = 0')
            self.__append_increase_SP()

    def __append_frame_with_index(self, symbol, index):
        self.__append_command('@FRAME')
        self.__append_command('D = M')
        self.__append_command('@%d' % index)
        self.__append_command('D = D - A')
        self.__append_command('A = D')
        self.__append_command('D = M')
        self.__append_command('@%s' % symbol)
        self.__append_command('M = D')

    def write_return(self):
        self.__append_command('@LCL // FRAME = LCL')
        self.__append_command('D = M')
        self.__append_command('@FRAME')
        self.__append_command('M = D')
        self.__append_frame_with_index('ret', 5)
        self.__append_first_SP()
        self.__append_command('D = M // *ARG = pop()')
        self.__append_command('@ARG')
        self.__append_command('A = M')
        self.__append_command('M = D')
        self.__append_command('@ARG // SP = ARG + 1')
        self.__append_command('D = M+1')
        self.__append_command('@SP')
        self.__append_command('M = D')
        self.__append_frame_with_index('THAT', 1)
        self.__append_frame_with_index('THIS', 2)
        self.__append_frame_with_index('ARG', 3)
        self.__append_frame_with_index('LCL', 4)
        self.__append_command("@ret")
        self.__append_command("A = M")
        self.__append_command('0;JMP')
        #self.cur_function.pop()

    def write_call(self, function_name, num_args):
        return_label = "RET_" + self.cur_function[-1] + str(len(commands))
        # push return-address
        self.__append_command("@%s" % return_label)
        self.__append_command('D = A')
        self.__append_push_to_stack()
        self.__append_increase_SP()
        #push LCL
        self.__append_command("@LCL")
        self.__append_command('D = M')
        self.__append_push_to_stack()
        self.__append_increase_SP()
        # push ARG
        self.__append_command("@ARG")
        self.__append_command('D = M')
        self.__append_push_to_stack()
        self.__append_increase_SP()
        # push THIS
        self.__append_command("@THIS")
        self.__append_command('D = M')
        self.__append_push_to_stack()
        self.__append_increase_SP()
        # push THAT
        self.__append_command("@THAT")
        self.__append_command('D = M')
        self.__append_push_to_stack()
        self.__append_increase_SP()
        # ARG = SP - n - 5
        self.__append_command("@SP")
        self.__append_command('D = M')
        self.__append_command("@%d" % num_args)
        self.__append_command('D = D - A')
        self.__append_command("@5")
        self.__append_command('D = D - A')
        self.__append_command("@ARG")
        self.__append_command("M = D")
        # LCL = SP
        self.__append_command("@SP")
        self.__append_command('D = M')
        self.__append_command("@LCL")
        self.__append_command('M = D')
        # goto f
        self.__append_command("@%s" % function_name)
        self.__append_command('0;JMP')
        #self.write_goto(function_name)
        # define return-address label
        self.__append_command('(%s)' % return_label)







    def close(self):
        with open(self.filepath, 'w+') as file:
            for command in commands:
                file.write(command + '\n')

