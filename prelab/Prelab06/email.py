import re

def main():
    with open('Part2.in', 'r') as open_file:
        lines=open_file.readlines()
        for ll in lines:
            ll=ll.strip('\n')
            ll=re.sub(r'(purdue.edu)', r'ecn.\1',ll)
            ll=re.sub(r'(\d$)',r'\1/100',ll)
            ll=str(ll)
            print(ll)


if __name__== "__main__":
    main()




