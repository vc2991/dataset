LR_DS3=data.frame(CF_TREE_SAMPLE_csv)
summary(LR_DS3)
summary(LR_DS3$Balance)

table(LR_DS3$AGE_BKT)

quantile(LR_DS3$Age,c(1,5,10,25,50,75,90,95,99,100)/100)

c(ceiling(2.4),floor(2.4),trunc(2.4),round(2.4,0))

abs(-25)
sqrt(25)
exp(25)
log(25)

x=c(1,2,3,7,5,6,4,4)
c(min(x),max(x),mean(x),median(x),mode(x))

temp=table(x)
names(temp)[temp==max(temp)]

str="abcdefghijklmnopqrstuvwxyzabcdefghijklmnxyopqrstuvwxyz"
nchar(str)

regexpr("xy",str)[1] ## locate first instance of ppattern
i=gregexpr("xy",str) ##locate all instance where pattern in found

class(i)
i[[1]][1:length(i[[1]])]

regexpr("FG",str,ignore.case = T)[1] ## search when not case sensitive

substring(str, 1,10)

substr(str,regexpr("xy",str)[1],nchar(str)) ##search on pattern match

sub("xy","XY",str,ignore.case = F,fixed = T) ## substitution
gsub("xy","XY",str,ignore.case = F,fixed = T) ## substitution for all values

toupper(str) ## entire string to upper case
tolower(str) ## entire string to lower case

strsplit(str,"xy")

vc= function(vsc="topper",vsc="highetpackge")
{
  if(vc(vsc=="topper"))
    return(1)
}

get_mode = function(x)
{temp =table(x)
names(temp)[temp==max(temp)]
}
get_mode(LR_DS3$Balance)

aa=10
bb=20
local=function()
{
  print(aa)
  print(bb)
  aa=aa+10
  bb<<-bb+10
  print(aa)
  print(bb)
}
local()
print(aa)
print(bb)

LR_DS3$Occupation=as.character(LR_DS3$Occupation)
table(LR_DS3$Occupation)

start_time=proc.time()
for(i in 1:nrow(LR_DS3))
{
  if(LR_DS3$Occupation[i]==" ")
    LR_DS3$Occupation[i]="NA"
}
end_time=proc.time()
process_time= end_time -  start_time
process_time

table(LR_DS3$Occupation)

start_time= proc.time()
LR_DS3$Occupation= ifelse(LR_DS3$Occupation=="NA",MISC,LR_DS3$Occupation)
end_time=proc.time()
process_time=end_time-start_time
process_time
table(LR_DS3$Occupation)

start_time=proc.time()
aif=function(arg1)
{
  if(arg1=="MISC")
    {arg1==""}
    return(arg1)
  
}
LR_DS3$Occupation=sapply(LR_DS1$Occupation,aif)
end_time=proc.time()
process_time=end_time-start_time

hist(LR_DS3$Age,main = "Age Distribution",xlab = "Age",ylab = "Frequency",col="BLUE")

library(qcc)

freq_distribution= table(LR_DS3$AGE_BKT)
cnt_disctint= length(freq_distribution)


pareto.chart(freq_distribution,main="Age Bucket Pareto Chart",xlab="Age Buckets",ylab="Frequqncy",col=topo.colors(cnt_disctint))

abline(h=sum(freq_distribution)*0.8,col="red",lwd=2)



freq_distribution= table(lr_df$AGE_BKT)
cnt_disctint= length(freq_distribution)


pareto.chart(freq_distribution,main="Age Bucket Pareto Chart",xlab="Age Buckets",ylab="Frequqncy",col=topo.colors(cnt_disctint))

abline(h=sum(freq_distribution)*0.8,col="red",lwd=2)

boxplot(LR_DF$Age,main="Age Box Plot", ylab="Age in Yrs")
boxplot(Age ~ Gender,data = LR_DS3, main="Age Box Plot",xlab="Gender",ylab="Age in Years")



boxplot(Age~Gender,data=LR_DS3,main="Age Box Plot", ylab="Age in Yrs",col=c(2:(length(levels(LR_DS3$Gender)))+2))

pie_cnt= table(LR_DS3$AGE_BKT)
pie_pnt=pie_cnt*100/sum(pie_cnt)
pie_lbl=paste(pie_pnt,"%",sep="")
pie_lbl=paste(pie_cnt,pie_lbl,sep=";")
pie_lbl=paste(row.names(pie_pnt),pie_lbl,sep = "\n")
pie(pie_cnt,main="Age Pie Distribution",labels=pie_lbl)
box()

pie_cnt=table(LR_DS3$Age)
b=barplot(pie_cnt,main="Age Bar Plot",beside=T)
text(x=b,as.data.frame(pie_cnt)[,2]+3,format(as.data.frame(pie_cnt)[,2]),xpd=T,pos=3,cex=0.5)
grid()
box()

line_plot_data= table(LR_DS3$Age)
plot(line_plot_data,type="l",main="Age Frequency",xlab="Age",ylab="Frequency",pch=1)

plot(line_plot_data,type="l",main="Age Frequency",xlab="Age",ylab="Frequency",pch=1,col="Blue")
cnt_non_responder=with(LR_DS3[LR_DS3$Target==0,],table(Age))
lines(cnt_non_responder,col="red")

ggplot=ggplot()
ggplot=ggplot+geom_point(data=LR_DS3,aes(x=AGE_BKT,y=Balance))
ggplot

ds=ddply(LR_DS3, .(AGE_BKT),.fun=summarise,mean=mean(Balance,na.rm=T),sd=sd(Balance,na.rm = T))
ggplot=ggplot+geom_point(data=ds,aes(x=AGE_BKT,y=mean),colour='red',size=3)+
geom_errorbar(data=ds,aes(x=AGE_BKT,y=mean,ymin=mean-sd,ymax=mean+sd),colour='red',width=0.4)
ggplot

ggplot=ggplot()
ggplot= ggplot+geom_point(data=LR_DS3,aes(x=AGE_BKT,y=Balance))
ggplot=ggplot+facet_grid(Target~.)
ds=ddply(LR_DS3,.(Target,AGE_BKT),.fun=summarise,mean=mean(Balance,na.rm=T)
         ,sd=sd(Balance,na.rm=T))
gplot=ggplot+geom_point(data=ds,aes(x=AGE_BKT,y=mean),colour='red',size=3)
  geom_errorbar(data=ds,aes(x=AGE_BKT,y=mean,ymin=mean-sd,ymax=mean+sd)
                ,colour='red',width=0.4)
ggplot

