y=1 ## Variable to keep the count of no of employees
x=0 ## Intializing variable for repeated entries
while x==0: ## Loop for iteration
    name=input("Enter employee name: ")
    add=input("Enter employee address: ")
    email=input("Enter employee email: ")
    phone=int(input("Enter employee phone no: "))
    salary=int(input("Enter employee monthly salary:"))
## file handling codes
    f = open("Employee records.txt", "a")
    f.write("Employee "+str(y)+"\n"+"Name: "+str(name)+"\n"+"add: "+str(add)+"\n"+"mail: "+str(email)+"\n"+str(phone)+"\n"
                                                                                           +"Sal: "+str(salary)+"\n")
    f.close()
    x=int(input("Enter 0 to enter more records,else press 1: "))
    y+=1
