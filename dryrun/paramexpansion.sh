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

