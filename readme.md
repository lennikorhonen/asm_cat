# At (Assembly cat)

Program in assembly that reads and writes the file (atm. specified in code) to stdout

## Build program

NOTE: This currently works only on x86_64 machines and is only tested on linux

Git directory contains a make file so to build the program make sure you have make installed
then run
```
$ make
```
in the cloned directory

## Running program

The program can be run like `cat` except you need to always specify it to the directory where the binary exists

```
$ ~/binary/location/at file_to_read
```

## Linking the program to bin dir
Incase you want to run the program like cat you can create a symbolic link for it in your `/bin` directory

```
$ sudo ln -s /home/username/cloned_dir/at /bin/asm_cat
```

Now you can run

```
$ at .bashrc
```
