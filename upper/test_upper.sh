#!/bin/sh

echo "a" | ./upper

echo "A" | ./upper

echo  "" | ./upper

echo "abcde" | ./upper

echo "AbCdE" | ./upper

echo "ABCDE" | ./upper

echo "12ab34cd56" | ./upper

echo "12AB34CD56" | ./upper
