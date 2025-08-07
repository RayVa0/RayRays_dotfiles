import sys

def lerp(x,y,z):
    if (y - z) < 0:
        return -1
 #x is starting point 
 #y is end point point 
 #z is ratio should be 0 to 1
    return (y - x) * z

def main():
    args = sys.argv
    if len(sys.argv) > 4:
        if "-mcb" in args:
            print(lerp(float(sys.argv[1]),float(sys.argv[2]),float(sys.argv[3])/100))
        else:
            print(lerp(float(sys.argv[1]),float(sys.argv[2]),float(sys.argv[3])))
    else:
        print(lerp(0,100,0.5))

main()
