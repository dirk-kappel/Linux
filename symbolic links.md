# Symbolic Links

`ls -i`
- **-i** : shows inode number
- inode numbers are data objects that contain metadata about the files and directories they represent. 
- Include the file type, owner, group, permissions, and timestamps. Name or content is not stored.
- Specific to storage device and partition.

`ln -s <file to link> <path where link to show up>`
- **-s** : create a symbolic link
- Without the -s option, a hard link is created.
- Symbolic links cannot use relative paths, absolute paths must be used.
- If you rename the original file, the symbolic link will break.
- Hard links have the same inode number as the original file.
- Symbolic links can cross file systems, had links cannot.

