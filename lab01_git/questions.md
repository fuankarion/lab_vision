# Warmup Questions

1.  What is the clone url of this repository?
    https://github.com/fuankarion/lab_vision

2.  What is the output of the ``cal`` command?

       Februar 2016      
So Mo Di Mi Do Fr Sa  
    1  2  3  4  5  6  
 7  8  9 10 11 12 13  
14 15 16 17 18 19 20  
21 22 23 24 25 26 27  
28 29

# Homework Questions

1.  What is the ``grep``command?
    the command grep searches the contents of files and and prints those liness of text who match a given pattern 

2.  What is a *makefile*?
    Make file contains the targets needed for the compilation/build of a set of related source files 

4.  What does the ``-prune`` option of ``find`` do? Give an example
    if the comand file operates over a (set of) directory(ies) the find command wont descen into the directory hierachy

	find . -name '.bash*' -prune
    will look for any file whose names starts by ".bash" only on the current directory.

5.  Where is the ``grub.cfg``  file
    grub.cfg contains the information related to the bootable os installed in the sistem, this configurations provides the basic information so that the user can choose between several available OS at the grub screen.

6.  How many files with ``gnu`` in its name are in ``/usr/src``
    0 files. Actual output if the ls -la command

insgesamt 32
drwxr-xr-x  8 root root 4096 Feb  1 21:13 .
drwxr-xr-x 11 root root 4096 Dez 18 07:15 ..
drwxr-xr-x  2 root root 4096 Dez 18 07:15 bbswitch-0.7
drwxr-xr-x 24 root root 4096 Nov 28 09:44 linux-headers-3.19.0-32
drwxr-xr-x  7 root root 4096 Nov 28 09:44 linux-headers-3.19.0-32-generic
drwxr-xr-x  2 root root 4096 Nov 28 09:45 ndiswrapper-1.59
drwxr-xr-x  4 root root 4096 Feb  1 21:13 nvidia-352-352.79
lrwxrwxrwx  1 root root   32 Jan 19 12:47 vboxhost-5.0.14 -> ../share/virtualbox/src/vboxhost
drwxr-xr-x  7 root root 4096 Nov 28 09:37 virtualbox-guest-5.0.4

7.  How many files contain the word ``gpl`` inside in ``/usr/src``
    0

8.  What does the ``cut`` command do?
    According to the specified options it selects only parts of each line from a given file

9.  What does the ``wget`` command do?
    Wget will dowload the specified argument (an URI) from the internet

9.  What does the ``rsync`` command do?
    rsync can be used to copy files between computers or in the same computer unlike cp/scp it only copies the differences if the file already exists thus is very usefull for backups

10.  What does the ``diff`` command do?
    given at leats 2 files it will show the line by line differences between the files

10.  What does the ``tail`` command do?
   prints in the terminal the lñast 10 lines in a given file

10.  What does the ``tail -f`` command do?
    prints and HOLDS in the termnal the last lines of a given file, usefull for log files whertext is constanly appended

10.  What does the ``link`` command do?
    creates a hard link to the argument file

11.  How many users exist in the course server?
    >   answer

12. What command will produce a table of Users and Shells sorted by shell (tip: using ``cut`` and ``sort``)
    cut -d: -f1,7 /etc/passwd | sort -k2

13. What command will produce the number of users with shell ``/sbin/nologin`` (tip: using ``grep`` and ``wc``)
    cut -d: -f1,7 /etc/passwd | grep "/sbin/nologin" | wc -l

15. Create a script for finding duplicate images based on their content (tip: hash or checksum)
    You may look in the internet for ideas, but please indicate the source of any code you use
    Save this script as ``find_duplicates.sh`` in this directory and commit your changes to github

16. What is the meaning of ``#! /bin/bash`` at the start of scripts?
    Specifies which shell should be used to run the script bash in this case

17. How many unique images are in the ``sipi_images`` database?
    >   answer
    
