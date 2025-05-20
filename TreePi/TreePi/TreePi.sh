#!/bin/bash
#SBATCH -p main      # Queue name
#SBATCH --mem=200000

# Compiler and flags
GCC="g++ -O3"

# List all source files
SRC_FILES="TreePi.cpp BTreePlus.cpp Graph.cpp"

# List all object files
OBJ_FILES="TreePi.o BTreePlus.o Graph.o"

# Compile individual object files
for src in $SRC_FILES; do
    obj="${src%.cpp}.o"
    $GCC -c $src -o $obj
done

$GCC -o TreePi $OBJ_FILES

./TreePi
