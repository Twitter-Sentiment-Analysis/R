library(ROAuth)
library(twitteR)

consumer_key <-"AKJsxNqX2D8uTo9orgjRirvWL"
consumer_secret <- "QOKk0ctHhbXNQ5QaipqofrZQzWM92mfkcoP60xe7HJzjSUCz6F"
access_token<-"2617540074-5l6gGJhCP8iw9DS7sVD9qsFaUGfWGO9fqlHt5Wg"
access_secret <- "VVMfNIzgPEUmCk5QyIWr5A4ZSC2Lxy7CERoUtWs4jAe0l"

 setup_twitter_oauth(consumer_key ,consumer_secret, access_token,  access_secret )
 
cred <- OAuthFactory$new(consumerKey='AKJsxNqX2D8uTo9orgjRirvWL', consumerSecret='QOKk0ctHhbXNQ5QaipqofrZQzWM92mfkcoP60xe7HJzjSUCz6F',requestURL='https://api.twitter.com/oauth/request_token',accessURL='https://api.twitter.com/oauth/access_token',authURL='https://api.twitter.com/oauth/authorize')

cred$handshake(cainfo="cacert.pem")
#After this you will be redirected to a URL where you click on authorize app and get the passkey to be entered in RStudio
