# Top tweeters for a particular hashtag (Barplot)
# Timeline for particular tweet hourwise over a period of time (ggplot)

library(ggplot2)

tweets <- list()
dates <- paste("2016-09-",1:3,sep="") #SUGGESTION: Modify these dates of upto 7 days before running this program 
for (i in 2:length(dates)) {
  print(paste(dates[i-1], dates[i]))
  tweets <- c(tweets, searchTwitter("#picture", since=dates[i-1], until=dates[i], n=1000))
}

# as.Date(as.Date(Sys.Date()-7):as.Date(Sys.Date()), origin="1970-01-01") //general view

# Convert the list to a data frame
tweets <- twListToDF(tweets)
tweets <- unique(tweets)

# To ensure accuracy, there should be no more than 1500 tweets in a single day.
# If there are 1500 on any single day, then you're truncating that day's 
#tweets, and you'll need to try to get ROAuth (below) working.
tweets$date <- format(tweets$created, format="%Y-%m-%d")
table(tweets$date)

# @sciencestream is a spambot that's RT'ing everything on the #ISMB tag. 
#Get rid of those.
#tweets <- tweets[which(tweets$screenName!="sciencestream"), ]

# Make a table of the number of tweets per user
d <- as.data.frame(table(tweets$screenName))
d <- d[order(d$Freq, decreasing=T), ] #descending order of tweeters according to frequency of tweets
names(d) <- c("User","Tweets")
head(d)

# Plot the table above for the top 20
barplot(head(d$Tweets, 20), names=head(d$User, 20), horiz=T, las=1, main="Top 20: Tweets per User", col=1)

# Plot the frequency of tweets over time in one hour windows
# Modified from http://michaelbommarito.com/2011/03/12/a-quick-look-at-march11-saudi-tweets/
minutes <- 60
ggplot(data=tweets, aes(x=created)) + 
  geom_histogram(aes(fill=..count..), binwidth=60*minutes) + 
  scale_x_datetime("Date") + 
  scale_y_continuous("Frequency")
  
#For making a (monstrous):O line plot instead:
#ggplot(data=tweets, aes(x=created)) + 
#  geom_area(aes(y=..count..), stat="bin") + 
#  scale_x_datetime("Date") + 
#  scale_y_continuous("Frequency")
