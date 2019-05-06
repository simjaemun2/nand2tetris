from projects.src07.vmconfig import CommandType


class Parser:
    def __init__(self, filename):
        filter_command = lambda s: len(s) > 0 and not s.startswith('//')

        with open(filename, 'r') as file:
            self.filelines = [line
                              for line in map(str.strip, file.readlines())
                              if filter_command(line)]
        self.index = 0
        self.cur_command_token = []
        self.cur_arith = ""
        self.arithmetic_commands = {'add', 'sub', 'neg', 'eq', 'gt', 'lt', 'and', 'or', 'not'}

    def has_more_commands(self):
        return self.index < len(self.filelines)

    def advance(self):
        self.cur_command_token = self.filelines[self.index].split()
        self.cur_arith = self.cur_command_token[0]
        self.index += 1

    def get_command_type(self):
        if self.cur_arith in self.arithmetic_commands:
            ret = CommandType.C_ARITHMETIC
        elif self.cur_arith == "push":
            ret = CommandType.C_PUSH
        elif self.cur_arith == "pop":
            ret = CommandType.C_POP
        elif self.cur_arith == "label":
            ret = CommandType.C_LABEL
        elif self.cur_arith == "goto":
            ret = CommandType.C_GOTO
        elif self.cur_arith == "if-goto":
            ret = CommandType.C_IF
        elif self.cur_arith == "funtion":
            ret = CommandType.C_FUNCTION
        elif self.cur_arith == "return":
            ret = CommandType.C_RETURN
        elif self.cur_arith == "call":
            ret = CommandType.C_CALL
        return ret

    def get_arith(self):
        return self.cur_arith

    def get_arg1(self):
        return self.cur_command_token[1]

    def get_arg2(self):
        return int(self.cur_command_token[2])



