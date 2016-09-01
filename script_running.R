 library(ROAuth)
library(twitteR)

consumer_key <-"AKJsxNqX2D8uTo9orgjRirvWL"
consumer_secret <- "QOKk0ctHhbXNQ5QaipqofrZQzWM92mfkcoP60xe7HJzjSUCz6F"
access_token<-"2617540074-5l6gGJhCP8iw9DS7sVD9qsFaUGfWGO9fqlHt5Wg"
access_secret <- "VVMfNIzgPEUmCk5QyIWr5A4ZSC2Lxy7CERoUtWs4jAe0l"

 setup_twitter_oauth(consumer_key ,consumer_secret, access_token,  access_secret )
 
cred <- OAuthFactory$new(consumerKey='AKJsxNqX2D8uTo9orgjRirvWL', consumerSecret='QOKk0ctHhbXNQ5QaipqofrZQzWM92mfkcoP60xe7HJzjSUCz6F',requestURL='https://api.twitter.com/oauth/request_token',accessURL='https://api.twitter.com/oauth/access_token',authURL='https://api.twitter.com/oauth/authorize')

cred$handshake(cainfo="cacert.pem")
	
sindhu.tweets = searchTwitter(‘@sindhu’, n=1500)

#Adding words to positive and negative databases
pos.words=c(pos.words, 'Congrats', 'prizes', 'prize', 'thanks', 'thnx', 'Grt', 'gr8', 'plz', 'trending', 'recovering', 'brainstorm', 'leader')
neg.words = c(neg.words, 'Fight', 'fighting', 'wtf', 'arrest', 'no', 'not')

#Extracting textual part of the tweets

#sample=NULL  #Initialising  #We can get the text from df$text, which are the cleand tweets
#for (tweet in sindhu.tweets)
#sample = c(sample,tweet$getText())

#Removing emoticons

#s <- searchTwitter('#emoticons', cainfo="cacert.pem")
df <- do.call("rbind", lapply(sindhu.tweets, as.data.frame))
df$text <- sapply(df$text,function(row) iconv(row, "latin1", "ASCII", sub=""))

# Clean the tweets
result = score.sentiment(df$text, pos.words, neg.words)


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

#Making percentage columns

p=table_final$Positive/(table_final$Positive+table_final$Negative)
p[ is.nan(p) ] <- 0
table_final$Postive_percentage=p
rename(table_final, c("Positive_percentage"=Pos_percent"))
n=table_final$Positive/(table_final$Positive+table_final$Negative)
n[ is.nan(n) ] <- 0
table_final$Neg_percent=n


#Creating Histogramm

hist(table_final$Score, colour=rainbow(10))
hist(table_final$Positive, colour=rainbow(10))
hist(table_final$Negative, colour=rainbow(10))

#Creating Pie Chart

install.packages("plotrix")
library(plotrix)

 slices <- c(sum(table_final$Positive), sum(table_final$Negative))
lbls <- c("Positive", "Negative")
pie(slices, labels = lbls, col=rainbow(length(lbls)), main="Sentiment Analysis")
pie3D(slices, labels = lbls, explode=0.0, col=rainbow(length(lbls)), main="Sentiment Analysis")

#Creating Pie chart with percentages for degree of positive,neagtive,neutral

Sc= table_final$Score
good<- sapply(table_final$Score, function(Sc) Sc > 0 && Sc <= 3)
pos1=table_final$Score[good]
pos1_len=length(pos1)

vgood<- sapply(table_final$Score, function(Sc) Sc > 3 && Sc < 5)
pos2=table_final$Score[vgood]
pos2_len=length(pos2)

vvgood<- sapply(table_final$Score, function(Sc) Sc >= 6)
pos3=table_final$Score[vvgood]
pos3_len=length(pos3)

Sc= table_final$Score
bad<- sapply(table_final$Score, function(Sc) Sc < 0 && Sc >= -3)
neg1=table_final$Score[bad]
neg1_len=length(neg1)

vbad<- sapply(table_final$Score, function(Sc) Sc < -3 && Sc >= -5)
neg2=table_final$Score[vbad]
neg2_len=length(neg2)

vvbad<- sapply(table_final$Score, function(Sc) Sc <= -6)
neg3=table_final$Score[vvbad]
neg3_len=length(neg3)

neutral= sapply(table_final$Score, function(Sc) Sc == 0)
neu=table_final$Score[neutral]
neu_len=length(neu)

slices1 <- c(pos1_len,neg3_len, neg1_len, pos2_len,  neg2_len, neu_len, pos3_len)
lbls1 <- c( "Good","Awful","Unsatisfactory", "Great", "Poor", "Neutral", "Outstanding")
pct=round(slices1/sum(slices1)*100)
lbls1 <- paste(lbls1, pct) # add percents to labels 
lbls1 <- paste(lbls1,"%",sep="") # ad % to labels 
pie(slices1,labels = lbls1, col=rainbow(length(lbls1)),
  	main="No. of tweets with particular sentiment")

#WORDCLOUD

#install.packages("wordcloud")
library(wordcloud)

#install.packages("tm")
library(tm)

earthquake.tweets=searchTwitter("earthquake", lang="en", n=1500, resultType="recent")
df <- do.call("rbind", lapply(earthquake.tweets, as.data.frame))
earthquake_text <- sapply(df$text,function(row) iconv(row, "latin1", "ASCII", sub=""))

 #str(earthquake_text) -> gives character vector

quake_corpus = Corpus(VectorSource(earthquake_text))

#inspect(quake_corpus[1])

#clean text

quake_clean = tm_map(quake_corpus, removePunctuation)
quake_clean = tm_map(quake_clean, content_transformer(tolower))
quake_clean = tm_map(quake_clean, removeWords, stopwords("english"))
quake_clean = tm_map(quake_clean, removeNumbers)
quake_clean = tm_map(quake_clean, stripWhitespace)

#cleaning most frequent words
#italy_clean = tm_map(quake_clean, removeWords, c ("Italy", "earthquake"))
wordcloud(quake_clean, random.order=F,max.words=80, col=rainbow(50), scale=c(4,0.5))


