# Warm Up Questions

1.  What is the clone url of this repository? <br>
    https://github.com/fuankarion/lab_vision

2.  What is the output of the ``cal`` command?<br>

       Februar 2016      
So Mo Di Mi Do Fr Sa  
    1  2  3  4  5  6  
 7  8  9 10 11 12 13  
14 15 16 17 18 19 20  
21 22 23 24 25 26 27  
28 29

# Homework Questions

1.  What is the ``grep``command? <br>
    The command grep searches the contents of files and and prints those lines of text who match a given pattern 

2.  What is a *makefile*? <br>
    A make file is a plain text file, which contains the targets and instructions needed for the compilation/build of a set of  source files

4.  What does the ``-prune`` option of ``find`` do? Give an example <br>
    If the command 'find' operates over a (set of) directory(ies) the find command will not descend into the directory hierarchy. Example <br>

	``find . -name '.bash*' -prune`` <br>
    will look for any file whose names starts by ".bash" only on the current directory.<br>

5.  Where is the ``grub.cfg``  file <br>
    It is located under the path /boot/grub.  It contains the information related to the bootable OS installed in the system, this configurations provides the basic information so that the user can choose between several available OS at the grub screen.<br> 

6.  How many files with ``gnu`` in its name are in ``/usr/src`` <br>
    Tested in my home computer (linux mint 17.2 distro) there are 0 files. <br>

Actual output of the ``ls -la`` command<br>

insgesamt 32 <br>
drwxr-xr-x  8 root root 4096 Feb  1 21:13 .<br>
drwxr-xr-x 11 root root 4096 Dez 18 07:15 ..<br>
drwxr-xr-x  2 root root 4096 Dez 18 07:15 bbswitch-0.7<br>
drwxr-xr-x 24 root root 4096 Nov 28 09:44 linux-headers-3.19.0-32<br>
drwxr-xr-x  7 root root 4096 Nov 28 09:44 linux-headers-3.19.0-32-generic<br>
drwxr-xr-x  2 root root 4096 Nov 28 09:45 ndiswrapper-1.59<br>
drwxr-xr-x  4 root root 4096 Feb  1 21:13 nvidia-352-352.79<br>
lrwxrwxrwx  1 root root   32 Jan 19 12:47 vboxhost-5.0.14 -> ../share/virtualbox/src/vboxhost<br>
drwxr-xr-x  7 root root 4096 Nov 28 09:37 virtualbox-guest-5.0.4<br>

7.  How many files contain the word ``gpl`` inside in ``/usr/src``<br>
    Tested in my home computer (linux mint 17.2 distro) there are 0 files. 

8.  What does the ``cut`` command do? <br>
    According to the specified options it selects only parts of each line from a given file. It might split the line given a String and also select the produced String tokens according to its index

9.  What does the ``wget`` command do? <br>
    wget downloads the specified argument (an URI) from the internet, stores it on the local disk

9.  What does the ``rsync`` command do? <br>
    rsync can be used to copy files between computers or between directories in the same computer. Unlike the ``(s)cp`` command,  if the target file already exists it only copies the differences. Thus it is very useful for backups

10.  What does the ``diff`` command do? <br>
    Given 2 files it will show the line by line differences between the files

10.  What does the ``tail`` command do? <br>
   Prints in the terminal the last 10 lines of the argument file

10.  What does the ``tail -f`` command do? <br>
    Prints and HOLDS in the terminal the last lines of a given file, useful for log files where text is constantly appended

10.  What does the ``link`` command do? <br>
    creates a hard link to the argument file

11.  How many users exist in the course server? <br>
    The command ``cut -d: -f1,7 /etc/passwd | wc -l``  gives the result 30 (run at 18/2/2016 8:36 am )

12. What command will produce a table of Users and Shells sorted by shell (tip: using ``cut`` and ``sort``) <br>
    ``cut -d: -f1,7 /etc/passwd | sort -k2``

13. What command will produce the number of users with shell ``/sbin/nologin`` (tip: using ``grep`` and ``wc``) <br>
    ``cut -d: -f1,7 /etc/passwd | grep "/sbin/nologin" | wc -l``

15. Create a script for finding duplicate images based on their content (tip: hash or checksum)
    You may look in the internet for ideas, but please indicate the source of any code you use
    Save this script as ``find_duplicates.sh`` in this directory and commit your changes to github

16. What is the meaning of ``#! /bin/bash`` at the start of scripts? <br>
    Specifies which shell should be used to run the script bash in this case

17. How many unique images are in the ``sipi_images`` database? <br>
    
    


