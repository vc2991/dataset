mydata = read.csv("C:/Users/vitis/OneDrive/Desktop/4 TH SEM MBA/ML/DATA SET/ODI_data.csv",na.strings = ",")
summary(mydata)# basic summary of the data 


#finding the correlation between Innings runs scored with Innings minutes batted
cor(mydata[c("Innings.Runs.Scored.Num","Innings.Minutes.Batted")])
summary(mydata[c("Innings.Runs.Scored.Num","Innings.Minutes.Batted")])


#sub-setting of the data 
mydata1 = subset(mydata,select = c("Innings.Runs.Scored.Num","Innings.Minutes.Batted","Innings.Balls.Faced"))
summary(mydata1)
cor(mydata1)

#Simple regression for Innings runs scored with innings mintues batted 
mydata1.lm <- lm( Innings.Runs.Scored.Num~Innings.Minutes.Batted, data = mydata1)
summary(mydata1.lm)

#simple regression for innings runs scored with innings faced balls 
mydata1.lm <- lm( Innings.Runs.Scored.Num~Innings.Balls.Faced, data = mydata1)
summary(mydata1.lm)

#plotting for innings runs scored with innings minutes batted 
plot(Innings.Runs.Scored.Num~Innings.Minutes.Batted, data = mydata1)

#plotting for innings runs scored with innings balls batted 
plot(Innings.Runs.Scored.Num~Innings.Balls.Faced, data = mydata1)

#using subset of dataset1, for taking out the players how scored more than 25t runs
mydata2 = subset(mydata,Innings.Runs.Scored.Num > 25 )
print(mydata2)

##categorical variable for taking out the players with more than 25 runs and 10 mins of batting time

library(mosaic)
tally(~Innings.Runs.Scored.Num > 25 , data = mydata2 , margin = TRUE)
tally(~Innings.Minutes.Batted > 10 , data = mydata2 , margin = TRUE)
tally(~Innings.Runs.Scored.Num > 25 , data = mydata2 , margin = TRUE,format = "perc")
tally(~Innings.Minutes.Batted > 10 , data = mydata2 , margin = TRUE, format = "perc")

tally(~Innings.Runs.Scored.Num > 25 , data = mydata2 , margin = TRUE,format = "prop")
tally(~Innings.Minutes.Batted > 10 , data = mydata2 , margin = TRUE, format = "prop")



## contingency tables
tally(~Innings.Minutes.Batted|Innings.Runs.Scored.Num > 25 , data = mydata, margin = TRUE)

favstats(~Innings.Balls.Faced, data = mydata)
favstats(~Innings.Minutes.Batted,data = mydata)
favstats(~Innings.Runs.Scored.Num,data = mydata)


# r part libary for forcasting tree
library(rpart)
library(rpart.plot)
mydata3= read.csv("C:/Users/vitis/OneDrive/Desktop/4 TH SEM MBA/ML/DATA SET/ODI_data.csv")

tree = rpart(Innings.Player ~Innings.Runs.Scored.Num+Innings.Runs.Scored.Num,mydata3)
print(tree)
rpart.plot(tree)


# scatters plot for innings runs scored with innings mins batted with balls faced 
mydata4<-ggplot(mydata1, aes(x=Innings.Runs.Scored.Num, y=Innings.Minutes.Batted+Innings.Balls.Faced))+
  geom_point()
mydata4


#to check if their is any null value in the subset of the data 
unique(mydata$Innings.Runs.Scored.Num)
unique(mydata$Innings.Minutes.Batted)

#to analysis for each payers as individual for example (V Kohli)
data=read.csv("C:/Users/vitis/OneDrive/Desktop/4 TH SEM MBA/ML/DATA SET/ODI_data.csv")
runscr=kohli$Innings.Runs.Scored.Num
ing_m=kohli$Innings.Minutes.Batted
ing_b=kohli$Innings.Balls.Faced

kohli=data[data$Innings.Player=='V Kohli',c("Innings.Runs.Scored.Num","Innings.Minutes.Batted","Innings.Balls.Faced")]
kohli
unique(kohli$Innings.Minutes.Batted)


#plotting of data on innings balls faced by V Kohli with runs scored 
plot(kohli$Innings.Balls.Faced,kohli$Innings.Runs.Scored.Num,main=eq,xlab = 'Balls Faced',ylab='Runs Scored')
abline(multi.fit,col='blue')

#plotting of data on balls faced with mintues batted 
plot(kohli$Innings.Balls.Faced,kohli$Innings.Minutes.Batted,main=eq,xlab = 'Balls Faced',ylab='Mintues Batted')
abline(multi.fit,col='Red')

attach(kohli)
multi.fit=lm(Innings.Runs.Scored.Num~Innings.Balls.Faced,data = kohli)
summary(multi.fit)
detach(kohli)


#finding out the coefficient of the innings runs scored with innings balls faced
coeff=coefficients(multi.fit)
eq = paste0("y = ", round(coeff[2],1), "*x ", round(coeff[1],1))


kohli$Innings.Balls.Faced=as.numeric(kohli$Innings.Balls.Faced)
kohli$Innings.Runs.Scored.Num=as.numeric(kohli$Innings.Runs.Scored.Num)
kohli$Innings.Minutes.Batted=as.numeric(kohli$Innings.Minutes.Batted)

#box plot with aligning of innings runs scored with minutes
boxplot(Innings.Runs.Scored.Num ~ Innings.Minutes.Batted, data = kohli, xlab = "Innings Minutes Batted",
        ylab = "Runs Scored", main = "Runs Scored with minutes spent")

#box plot with aligning of innings runs scored with number of balls faced
boxplot(Innings.Runs.Scored.Num ~ Innings.Balls.Faced, data = kohli, xlab = "Balls faced ",
        ylab = "Runs Scored", main = "Number of balls faced ")

#box plot with aligning of innings runs scored with number of balls faced and time taken
boxplot(Innings.Runs.Scored.Num ~ Innings.Balls.Faced +Innings.Minutes.Batted , data = kohli, xlab = "Balls faced with Time taken ",
        ylab = "Runs Scored", main = "Number of balls faced with Time ")