earthquake.tweets = searchTwitter("earthquake", lang="en", n=1500, resultType="recent")
earthquake_text = sapply(earthquake.tweets, function(x) x$getText())
df <- do.call("rbind", lapply(earthquake.tweets, as.data.frame))
earthquake_text <- sapply(df$text,function(row) iconv(row, "latin1", "ASCII", sub=""))
str(earthquake_text)

#corpus is a collection of text documents
library(tm)
quake_corpus <- Corpus(VectorSource(earthquake_text))
quake_corpus
inspect(quake_corpus[1])
#clean text
quake_clean <- tm_map(quake_corpus, removePunctuation)
quake_clean <- tm_map(quake_clean, content_transformation)
quake_clean <- tm_map(quake_clean, content_transformer(tolower))
quake_clean <- tm_map(quake_clean, removeWords, stopwords("english"))
quake_clean <- tm_map(quake_clean, removeNumbers)
quake_clean <- tm_map(quake_clean, stripWhitespace)
quake_clean <- tm_map(quake_clean, removeWords, c("Italy","earthquake"))#removing search words
#wordcloud
#wordcloud(quake_clean)
#wordcloud(quake_clean, random.order=F)
#wordcloud(quake_clean, random.order=F, scale=c(4,0.5))#max font size,min font size
#wordcloud(quake_clean, random.order=F,col=rainbow(50), scale=c(4,0.5))
wordcloud(quake_clean, random.order=F,max.words=80, col=rainbow(50), scale=c(4,0.5))
