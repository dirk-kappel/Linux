# Stream Editor (SED) : Used to filter and modify text.

`sed 's/Pineapple/Feta/' sed.txt`
- s: search every occurance of a string and replace it with another string
- The file itself is not modified. The output is printed to the terminal.

### To change in place use the -i option
`sed -i 's/Pineapple/Feta/' sed.txt`

### Delimeter:
- The character that follows s is the delimeter. It can be any character. The forward slash is the most common.
- `sed 's|Pineapple|Feta|' sed.txt` and `sed 's.Pineapple.Feta.' sed.txt` are both valid.
- May want to change the delimeter if you want to change a forward slash.

## Example:
### Create a file with a list of files that contain forward slashes, e.g.
`find /etc -type f > files.txt 2> /dev/null`

### Example to remove something, e.g. the /etc from the file
`sed 's./etc..' files.txt`
`sed 's|/etc|stuff|' files.txt`
- If you don't include anything in the second delimeter then it will remove it.
