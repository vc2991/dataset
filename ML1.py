import pandas as pd
import warnings
import numpy as np
from mpl_toolkits.mplot3d import Axes3D
from scipy.stats import pearsonr
from sklearn import datasets,linear_model
from sklearn.metrics import mean_squared_error
from sklearn.metrics import r2_score
import seaborn as sns
import matplotlib.pyplot as plt
data= pd.read_csv("/Users/vardaan/Documents/DataSets/ODI_data.csv")
warnings.filterwarnings('ignore')
pd.set_option('display.max_rows', None)
pd.set_option('display.max_columns', None)

## Cleaning the data -------

data = data[data['Innings Runs Scored Num'] != '-']
data = data.dropna(subset = ['Innings Runs Scored Num'])
data = data[data['Innings Minutes Batted'] != '-']
data = data.dropna(subset = ['Innings Minutes Batted'])
data = data[data['Innings Balls Faced'] != '-']
data = data.dropna(subset = ['Innings Balls Faced'])
data = data[data['Innings Batting Strike Rate'] != '-']
data = data.dropna(subset = ['Innings Batting Strike Rate'])

data['Innings Runs Scored Num']=data['Innings Runs Scored Num'].astype(str).astype(int)
data['Innings Minutes Batted']=data['Innings Minutes Batted'].astype(str).astype(int)
data['Innings Balls Faced']=data['Innings Balls Faced'].astype(str).astype(int)
data['Innings Batting Strike Rate']=data['Innings Batting Strike Rate'].astype(str).astype(float)
#print(data['Innings Batting Strike Rate']).unique
# --------------

# To get description about the data
print(data.keys())
print(data.describe())

#print(data['Innings Runs Scored Num'].unique())

# Block to Select a Player--------

player=set(data['Innings Player'])
#print(set(player))
search=input("Enter last 3 letters of the player to get the name from list:- ")
for x in player:
    if x[-3:]==search:
        print(x)
#---------------------------------
plyr=input("Enter player name as per the data:- \n")

## Sub setting for a player
kohli=data[data['Innings Player']==plyr]
kohli=kohli[['Innings Runs Scored Num','Innings Minutes Batted','Innings Balls Faced','Innings Batting Strike Rate']]


## Independent variables
chk=kohli[['Innings Balls Faced','Innings Minutes Batted','Innings Batting Strike Rate']]


kohli_x_train = kohli[['Innings Balls Faced','Innings Batting Strike Rate']]
kohli_z_train=kohli[['Innings Batting Strike Rate']]
kohli_x_test = kohli[['Innings Balls Faced',]]

#kohli_x_train = chk.values
#kohli_x_test = chk.values

kohli_y_train = kohli[['Innings Runs Scored Num']]
kohli_y_test = kohli[['Innings Runs Scored Num']]

model=linear_model.LinearRegression()
model2=linear_model.LinearRegression()
model2.fit(chk,kohli_y_train)
model.fit(kohli_x_train,kohli_y_train)
kohli_y_predicted=model.predict(kohli_x_train)
kohli_y_predicted2=model2.predict(chk)

#print("Mean squared error is: ",mean_squared_error(kohli_y_test,kohli_y_predicted))
print("Mean squared error is: ",mean_squared_error(kohli_y_test,kohli_y_predicted2))
print("Weights: ",model2.coef_)
print("Intercept: ",model2.intercept_)

# Univariate plot
#plt.scatter(kohli_x_test,kohli_y_test)
#plt.plot(kohli_x_test.values,kohli_y_predicted)
#plt.show()
#print(model.predict([[50]]))

R2=r2_score(kohli_y_test,kohli_y_predicted2)
print("R squared:- ",R2)
print("Correlation Coeff:- ",pearsonr(kohli['Innings Runs Scored Num'],kohli['Innings Balls Faced']))

## Pair plot for bivariate
sns.pairplot(kohli,x_vars=['Innings Balls Faced','Innings Minutes Batted'],kind="reg",y_vars='Innings Runs Scored Num',height=4,aspect=.7)
sns.pairplot(kohli,x_vars=['Innings Batting Strike Rate','Innings Minutes Batted'],kind="reg",y_vars='Innings Runs Scored Num',height=4,aspect=.7)

###    Block to get predicted Value

a=int(input("Enter balls faced \n"))
b=int(input("Enter minutes on crease\n"))
c=float(input("Enter Strike Rate\n"))
print("Predicted score is: ",model2.predict([[a,b,c]]))


## 3-D plotting for multivairate Regrresion

x_surf, y_surf = np.meshgrid(np.linspace(kohli['Innings Balls Faced'].min(), kohli['Innings Balls Faced'].max(), 100),np.linspace(kohli['Innings Batting Strike Rate'].min(), kohli['Innings Batting Strike Rate'].max(), 100))
onlyX = pd.DataFrame({'Innings Balls Faced': x_surf.ravel(), 'Innings Batting Strike Rate': y_surf.ravel()})
fittedY=model.predict(onlyX)
## convert the predicted result in an array
fittedY=np.array(fittedY)
fittedY

fig = plt.figure(figsize=(20,10))

### Set figure size
ax = fig.add_subplot(111, projection='3d')
ax.scatter(kohli['Innings Balls Faced'],kohli['Innings Batting Strike Rate'],kohli['Innings Runs Scored Num'],c='red', marker='o', alpha=0.5)
ax.plot_surface(x_surf,y_surf,fittedY.reshape(x_surf.shape), color='b', alpha=0.3)
ax.set_xlabel('Balls Faced')
ax.set_ylabel('Strike Rate')
ax.set_zlabel('Runs Scored')
plt.show()
