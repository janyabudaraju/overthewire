#!/opt/homebrew/bin/expect
if {[llength $argv] > 0} {
    set LVL [lindex $argv 0]
    set PWD [exec sed -n "s/level $LVL password: //p" pwds.txt]
} else {
	set LAST_LINE [exec tail -n 1 pwds.txt]
	set LVL [exec echo $LAST_LINE | sed -n {s/level \([0-9][0-9]*\) password: .*/\1/p}]
	set PWD [exec echo $LAST_LINE | sed -n {s/level [0-9][0-9]* password: \(.*\)/\1/p}]
}

#set LVL [lindex $argv 0]
#set PWD [exec sed -n "s/level $LVL password: //p" pwds.txt]
spawn ssh bandit$LVL@bandit.labs.overthewire.org -p 2220
expect "bandit${LVL}@bandit.labs.overthewire.org's password:"
send "${PWD}\r"
interact
