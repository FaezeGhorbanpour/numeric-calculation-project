import re
import operator
import math
import sys

class Tree:
    def __init__(self, value, left=None, right=None):
        self.value = value
        self.left  = left
        self.right = right

    def __str__(self):
        return str(self.value)
def get_token(token_list, expected):
    if token_list[0] == expected:
        del token_list[0]
        return True
    else:
        return False
def get_product(token_list):
    a = get_number(token_list)
    if get_token(token_list, '^'):
        b = get_number(token_list)
        return Tree('^', a, b)
    elif get_token(token_list, '*'):
        b = get_number(token_list)
        return Tree ('*', a, b)
    elif get_token(token_list, '/'):
        b = get_number(token_list)
        return Tree ('/', a, b)
    else:
        return a
def get_sum(token_list):
    a = get_product(token_list)
    if get_token(token_list, '^'):
        b = get_sum(token_list)
        return Tree('^', a, b)
    if get_token(token_list,'*'):
        b = get_sum(token_list)
        return Tree ('*', a, b)
    elif get_token(token_list, '/'):
        b = get_sum(token_list)
        return Tree ('/', a, b)
    elif get_token(token_list, '+'):
        b = get_sum(token_list)
        return Tree ('+', a, b)
    elif get_token(token_list, '-'):
        b = get_sum(token_list)
        return Tree ('-', a, b)
    else:
        return a
def get_number(token_list):
    if get_token(token_list, '('):
        x = get_sum(token_list) 
        get_token(token_list, ')')     
        return x
    else:
        x = token_list[0]
        token_list[0:1] = []
        return Tree (x, None, None)
def evaluate(parseTree):
    global s,p
    opers = {'+':operator.add, '-':operator.sub, '*':operator.mul, '/':operator.truediv , '^' : operator.pow}
 
    leftC = parseTree.left
    rightC = parseTree.right
    if leftC and rightC:
        leftValue,leftAbsolute,leftRelative = evaluate(leftC)
        rightValue,rightAbsolute,rightRelative = evaluate(rightC)
        s += 'Expression : ' + str(leftValue) + parseTree.value + str(rightValue) + '\n'
        if type(leftValue) == type('') or type(rightValue) == type(''):
            s += "Absolte Error = " + 'e('+str(leftValue)+parseTree.value+str(rightValue)+')' + "\n"
            s += "Relative Error = " +'&('+str(leftValue)+parseTree.value+str(rightValue)+')' + "\n\n"
            return '('+str(leftValue)+parseTree.value+str(rightValue)+')','' ,''
        fn = opers[parseTree.value]
        Value = fn(leftValue,rightValue)
        if parseTree.value == '+'or parseTree.value == '-':
            Absolute = leftAbsolute + rightAbsolute
            Relative = float("%0.*f"%(p,float(leftValue*leftRelative)/abs(Value)))\
                       +float("%0.*f"%(p,float(rightValue*rightRelative)/abs(Value)))
        elif  parseTree.value == '*' :
            Absolute = float("%0.*f"%(p,leftAbsolute*abs(rightValue)))+float("%0.*f"%(p,rightAbsolute*abs(leftValue)))
            Relative = leftRelative + rightRelative
        elif parseTree.value == '/':
            Absolute = float("%0.*f"%(p,float("%0.*f"%(p,float(leftAbsolute*abs(rightValue))))+float("%0.*f"%(p,rightAbsolute*abs(leftValue)))
                                      /float("%0.*f"%(p,math.pow(rightValue,2)))))
            Relative = float("%0.*f"%(p,leftRelative + rightRelative))
        elif parseTree.value == '^' :
            if rightValue < 0:
                leftAbsolute = float("%0.*f"%(p,float(leftAbsolute)/math.pow(leftAbsolute,2)))
            Absolute = float("%0.*f"%(p,rightValue*abs(leftValue)*leftAbsolute))
            Relative = float("%0.*f"%(p,abs(rightValue)*leftRelative))
        s += "Absolte Error = " + str(Absolute) + "\n"
        s += "Relative Error = "+ str(Relative) + "\n\n"
        return Value,Absolute,Relative
    else:
        if type(parseTree.value) == type(0.0):
            return parseTree.value,0,0
        if parseTree.value in parameter:
            index = parameter.index(parseTree.value)
            return values[index],absolute[index],relative[index]
        else:
            return parseTree.value,'e('+parseTree.value+')','&('+parseTree.value+')'
def isNumber(s):
    try:
        int(s)
        return True
    except ValueError:
        return False
def parse(phrase) :
    numbers = re.findall("[.]?\d+[\.]?\d*", phrase)
    l = []
    i=0
    o=0
    for o in range(len(phrase)):
        c = phrase[o]
        if isNumber(c)==False and c!='.':
            l.append(c)
        elif isNumber(c):
            if o>0 :
                if (isNumber(phrase[o-1]) or phrase[o-1] == '.'):
                    continue
            l.append(float(numbers[i]))
            i+=1
    return l
if __name__ == '__main__':
    global s,p
    with open('tem.txt') as F:
        function = parse(F.readline())
        parameter = [x for x in F.readline().split() if x != '\n']
        values = [float(x) for x in F.readline().split() if x != '\n']
        absolute = [float(x) for x in F.readline().split() if x != '\n']
        p = int(F.readline()) - 1
    F.close()
    relative = [float("%.*f"%(p, absolute[i]/values[i])) if values[i] != 0 else float("inf") for i in range(len(parameter))]
    s = ''
    evaluate(get_sum(function))
    sys.stdout.write(s)