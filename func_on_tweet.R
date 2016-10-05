
# Clean the tweets
result = score.sentiment(sample, pos.words, neg.words)

library(reshape)
#Creating a copy of result data frame
test1=result[[1]]
test2=result[[2]]
test3=result[[3]]

#Creating three different data frames for Score, Positive and Negative
#Removing text column from data frame
test1$text=NULL
test2$text=NULL
test3$text=NULL
#Storing the first row(Containing the sentiment scores) in variable q
q1=test1[1,]
q2=test2[1,]
q3=test3[1,]
qq1=melt(q1, ,var='Score')
qq2=melt(q2, ,var='Positive')
qq3=melt(q3, ,var='Negative') 
qq1['Score'] = NULL
qq2['Positive'] = NULL
qq3['Negative'] = NULL
#Creating data frame
table1 = data.frame(Text=result[[1]]$text, Score=qq1)
table2 = data.frame(Text=result[[2]]$text, Score=qq2)
table3 = data.frame(Text=result[[3]]$text, Score=qq3)

#Merging three data frames into one
table_final=data.frame(Text=table1$Text, Score=table1$value, Positive=table2$value, Negative=table3$value)
