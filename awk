# awk is a scripting language that is used to manipulate data and generate reports.
# Spaces are delimeters for fields for an input file.
# Takes info from a file(commonly but not required) and outputs to standard output
# awk is designed to iterate over text files one line at a time.
awk 'if(PATTERN1){...do something...} if(PATTERN2){...do something else...}' input.file
# if is not needed, it is implied. Whatever pattern is in the parentheses then do what is in the curly braces.
(NR==1) : line number 1
# parentheses are optional

awk 'command' <file>
awk '{print}' awk.txt

# Print the first field of each line
awk '{print $1}' awk.txt 

# Print more than one field
awk '{print $1, $3}' awk.txt

# Can pipe a command into awk
ls -l | awk '{print $1}'

echo "Hello from awk" | awk '{print $3}'

# NF stands for number of fields. This will print out the last field of each line.
awk '{print $NF}' awk.txt

# When not seperated by spaces, awk will treat the whole line as one field.
awk '{print $2}' /etc/passwd

# Can use a delimiter to seperate fields. -F stands for field seperator.
awk -F':' '{print $1,$7}' /etc/passwd

# Regular expresion example.
awk '($0 ~ /r$/) {print $0}' awk.txt
# $0 is the whole line. ~ is the regular expression operator. /r$/ is the regular expression.
# This will print out all lines that end with r.