library(TwitteR)

#Get woeid of all locations on Earth
a_trends = availableTrendLocations()

#Get trending tweets worldwide
today_trends = getTrends(1);
head(today_trends);