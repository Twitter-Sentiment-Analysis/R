 library(ROAuth)
library(twitteR)

consumer_key <-"AKJsxNqX2D8uTo9orgjRirvWL"
consumer_secret <- "QOKk0ctHhbXNQ5QaipqofrZQzWM92mfkcoP60xe7HJzjSUCz6F"
access_token<-"2617540074-5l6gGJhCP8iw9DS7sVD9qsFaUGfWGO9fqlHt5Wg"
access_secret <- "VVMfNIzgPEUmCk5QyIWr5A4ZSC2Lxy7CERoUtWs4jAe0l"

 setup_twitter_oauth(consumer_key ,consumer_secret, access_token,  access_secret )
 
cred <- OAuthFactory$new(consumerKey='AKJsxNqX2D8uTo9orgjRirvWL', consumerSecret='QOKk0ctHhbXNQ5QaipqofrZQzWM92mfkcoP60xe7HJzjSUCz6F',requestURL='https://api.twitter.com/oauth/request_token',accessURL='https://api.twitter.com/oauth/access_token',authURL='https://api.twitter.com/oauth/authorize')

cred$handshake(cainfo="cacert.pem")
	
sindhu.tweets = searchTwitter(‘@sindhu’, n=1500
#Extracting textual part of the tweets

sample=NULL  #Initialising
for (tweet in sindhu.tweets)
sample = c(sample,tweet$getText())

#Removing emoticons

s <- searchTwitter('#emoticons', cainfo="cacert.pem")
df <- do.call("rbind", lapply(sample, as.data.frame))
df$text <- sapply(df$text,function(row) iconv(row, "latin1", "ASCII", sub=""))

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

