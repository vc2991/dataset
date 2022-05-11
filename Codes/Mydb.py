import mysql.connector

mydbs= mysql.connector.connect(
    host="localhost",
    user="root",
    password="mysql032991",
    database="mydb"
)

# TO print entire menu
mycursor = mydbs.cursor()
mycursor.execute("SELECT * FROM Item")
for x in mycursor:
  print(x)
# to print value * 2
mycursor.execute("SELECT Item_Name,Item_Price*2 from Item")
myresult = mycursor.fetchall()

for x in myresult:
  print(x)

