#! /bin/sh

gcc -o main main.c pseudocode_Ex1.c pseudocode_Ex2.c -lm
./main >output
bat output
