#!/bin/bash

echo "Scientific Calculator"
echo "1. Square Root"
echo "2. Factorial"
echo "3. Natural Logarithm"
echo "4. Power Function"
echo "5. Exit"
echo "Enter choice:"
read choice

case $choice in
    1) echo "Enter a number: "; read num; echo "Result: $(echo "sqrt($num)" | bc -l)";;
    2) echo "Enter a number: "; read num; fact=1;
       for (( i=1; i<=num; i++ )); do fact=$((fact * i)); done
       echo "Result: $fact";;
    3) echo "Enter a number: "; read num; echo "Result: $(echo "l($num)" | bc -l)";;
    4) echo "Enter base: "; read base; echo "Enter exponent: "; read exp;
       echo "Result: $(echo "$base^$exp" | bc -l)";;
    5) exit;;
    *) echo "Invalid choice, try again!";;
esac
