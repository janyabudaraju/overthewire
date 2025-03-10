### practice w stream editing using sed!

# syntax for translate command y///:
# sed 'y/source/destination/'

echo 123 | sed 'y/123/abc/' # result: abc
var1=123
var2=abc
# echo 1234 | sed 'y/$var1/$var2/' does NOT work. need double quotes for expansion
echo 1234 | sed "y/$var1/$var2/" # result: abc4

# bash substring expansion: ${var:expansion:offset}

#### sets var to default if unset ####
: ${var:=DEFAULT}
echo $var #result: DEFAULT
unset var
var="h"
: ${var:=DEFAULT}
echo $var #result: h

#### substitutes default if var is unset ####
unset var
echo ${var-"DEFAULT"} #result: not set
echo $var #result: empty

#### okay hang on tight here's the substring expansion! ####

# syntax: {param:offset} OR {param:offset:length}

var=01234567890abcd
echo $var
echo ${var:7} #result: 7890abcd
echo ${var:7:2} #result: 78
echo ${var: -2} #result: cd
echo ${var: -2:8} #result: cd
echo ${var::2} # result: 01

# okay now taking off the training wheels
b=abcdefghijklmnopqrstuvwxyz
a=ABCDEFGHIJKLMNOPQRSTUVWXYZ
r=1

echo "abcdeABCDE" | sed "y/$a$b/${a:$r}${a::$r}${b:$r}${b::$r}/" # result: bcdefBCDEF
