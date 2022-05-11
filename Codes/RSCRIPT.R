
colnames(CF_TREE_SAMPLE_csv)
colnames(CF_TREE_SAMPLE_csv)[9] = "Score"
colnames(CF_TREE_SAMPLE_csv)   

library(plyr)
LR_DF= rename(LR_DF,c(Score="SCR"))

str(CF_TREE_SAMPLE_csv)

LR_DF=CF_TREE_SAMPLE_csv
head(LR_DF)

str(LR_DF)

LR_DF$Cust_ID = as.character(LR_DF$Cust_ID)
class(LR_DF$Cust_ID)

class(LR_DF$Target)
table(LR_DF$Target)
LR_DF$Target= as.factor(LR_DF$Target)
class(LR_DF$Target)

LR_DF$Target= as.integer(LR_DF$Target)
table(LR_DF$Target)

LR_DF$Target= ifelse(LR_DF$Target == 1,0,1)
table(LR_DF$Target)
LR_DF$Target= as.integer(LR_DF$Target)
class(LR_DF$Target)

LR_DF$Target = as.factor(LR_DF$Target)
levels(LR_DF$Target)

LR_DF$Target= as.integer(levels(LR_DF$Target))[LR_DF$Target]
class(LR_DF$Target)
table(LR_DF$Target)

attach(LR_DF)
LR_DF_SORTED = LR_DF[order(Age, Holding_Period),]
LR_DF_DESC = LR_DF[order(-Age,Holding_Period),]
head(LR_DF_SORTED)
head(LR_DF_DESC)
detach(LR_DF)

table(LR_DF$AGE_BKT)
table(LR_DF$AGE_BKT,LR_DF$Gender)

with(LR_DF,table(AGE_BKT))
with(LR_DF,table(AGE_BKT,Gender))
as.data.frame(with(LR_DF, table(AGE_BKT)))

library(plyr)
ddply(LR_DF, c("AGE_BKT","Gender"),function(df)c(sum(df$Balance),min(df$Balance),max(df$Balance)))

ddply(LR_DF,c("AGE_BKT","Gender"),function(df)data.frame(sum_balance= sum(df$Balance),min_balance = min(df$Balance),max_balance= max(df$Balance)))

ddply(LR_DF, .(AGE_BKT, Gender),summarize,sum_balance=sum(Balance),min_balance= min(Balance), max_balance= max(Balance))

x="5L"
class(x)