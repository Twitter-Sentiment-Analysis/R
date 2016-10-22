#after authentication

library(TwitteR)

#Get woeid of all locations on Earth
#a_trends = availableTrendLocations()
#aa=sort(a_trends$name)

#take input of place
#get woeid
#print table of hashtag, url

#Let input Ottawa
a_trends = availableTrendLocations()
woeid = a_trends[which(a_trends$name=="Ottawa"),3]
canada_trends = getTrends(woeid)
trends = canada_trends[1:2]



#Get trending tweets worldwide
#today_trends = getTrends(1);

#To clean data and remove Non English words: (not required)
dat <- cbind(trends$name)
dat2 <- unlist(strsplit(dat, split=", "))
dat3 <- grep("dat2", iconv(dat2, "latin1", "ASCII", sub="dat2"))
dat4 <- dat2[-dat3]		
dat4
