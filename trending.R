#after authentication

library(TwitteR)

#Get woeid of all locations on Earth
a_trends = availableTrendLocations()
#Get woeid from input location
woeid=a_trends[3,which(a_trends$name == 'Ottawa')]


#Get trending tweets worldwide
today_trends = getTrends(1);
#head(today_trends);

dat <- cbind(getTrends(1)$name)
dat2 <- unlist(strsplit(dat, split=", "))
dat3 <- grep("dat2", iconv(dat2, "latin1", "ASCII", sub="dat2"))
dat4 <- dat2[-dat3]
dat4
