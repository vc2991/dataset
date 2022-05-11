class Dog():
    def __init__(self,name,breed):
        self.name = name
        self.breed = breed
    def display(self):
        print("dog:\t"+self.name+"\tbreed:\t"+self.breed)
d1= Dog("bruno","german sherperd")
d2= Dog("marco","huskey")
d3= Dog("tintin","pomerian")
d1.name="julius"
d1.display()







