
# Clean the tweets
result = score.sentiment(sample, pos.words, neg.words)


 library(reshape)
#Creating a copy of result data frame
test=result
#Removing text column from data frame
 result$text=NULL
#Storing the first row(Containing the sentiment scores) in variable q
q=result[1,]
qq=melt(q, ,var='Score') 
qq['Score'] = NULL
#Creating data frame
table = data.frame(Text=test$text, Score=qq)

