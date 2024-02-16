# Archive, Compress, and Unpack

### tar : used to archive files
`tar -cvf archive.tar file1.txt file2.txt file3.txt file4.txt`
- **c** : create an archive
- **v** : verbose
- **f** : takes argument to set the filename name of the archive

### Check archive content
`tar -tf archive.tar` : Shows all files without extracting.
- **t** : List contents of the archive.

### Archive directory
`tar -cvf etc_backup.tar /etc`
- This will archive the entire etc directory

### Extract archive
`tar -xvf etc_backup.tar`
- **x** : Extracting

## Compressed Files
- gzip : Fist method
- bzip2 : Better than gzip and provides smaller files
- xz : Newest. Best in compression ratio

`gzip file1.txt` : Compress file1 with gzip
- Has .gz extension
`bzip2 file2.txt` : Compress using bzip
- Has .bz2 extension
`xz file3.txt` : Compress using xzip
- Has .xz extension

## Decompress
`gunzip file1.txt.gz` : Decompresses the gzip file
`bunzip2 file2.txt.bz2` : Decompress bzip file
`xz -d file3.txt.xz` : **-d** : decompress

## Archive and Compress
`tar -zcvf etc_backup.tar.gz /etc`
- **z** : Compress the file using gzip method
`tar -jcvf etc_backup2.tar.bz2 /etc`
- **j** : Compress using the bzip2 method
`tar -Jcvf etc_backup3.tar.xz /etc`
- **J** : Compress using xz method

## Extract
`tar -zxvf etc_backup.tar.gz`
`tar -jxvf etc_backup.tar.bz2`
`tar -Jxvf etc_backup.tar.xz`