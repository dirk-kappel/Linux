# Standard In, Standard Out, Standart error

### stdout = standard output. What is being shown on the screen.

### stdin = standard input. Typing in the terminal.

### stderr = standard error. When an error is displayed on the screen. 

- echo $? - gives the return code of the previous command. 
- 0 = success, 1 = failure.

### Redirect stdout and stderr
- stderr :  2> /dev/null - 2 is the file descriptor for stderr. > is a redirect. /dev/null is a black hole.
- stdin : 0 - is is the default file descriptor for stdin.
- stdout : 1> /dev/null - 1 is the file descriptor for stdout. > is a redirect. /dev/null is a black hole.

`find /etc -type f > ~/results.txt` : standard error will got the screen and standard output will go to results.txt.
- Standard output is implied.
`find /etc -type f 1> ~/results.txt 2> ~/errors.txt`
- standard output will go to results.txt (1 can be omitted) and standard error will go to errors.txt.

