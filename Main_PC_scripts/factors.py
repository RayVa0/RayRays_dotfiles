#!/usr/bin/env python3

def main(x): 
    b = 1
    b_limit = x / 2

    while (b < b_limit):
        a_limit = x / b
        a = 1
        while ( a <= a_limit ):
            if a * b == x:
                print(a, b, sep="|")

            a = a + 1
            #print("a inc")
        b = b + 1
        #print("b inc")

print("Insert a number", end="")
main(int(input()))



