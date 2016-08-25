#Extracting textual part of the tweets

sample=NULL #Initialising
for (tweet in rahul.tweets)
sample = c(sample,tweet$getText())
