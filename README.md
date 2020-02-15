# Twitter Sentiment Analysis  
# R  
Takes feeds from Twitter into R. The sentiment of the tweets is analysed and classified into positive, negative and neutral tweets.  

### Pre-requisites 
1. Installation of R (Version 3.3.1) 
2. Twitter Authentication to access API

### Dependencies
- twitteR 
- stringr 
- ROAuth 
- RCurl 
- ggplot2 
- reshape 
- tm 
- RJSONIO 
- wordcloud 
- gridExtra 
- plyr 

### Steps for Execution  

#### Short Version -  
The codes are compiled into one file `script_running.R`.  

#### Longer Modular Version-  
For easier understanding, the above code is modularized and must be learnt in following order-  
The following are for lexical based twitter analyzer (Tweets to find sentiment about entities):  
1. authentication.R  
2. tweet_extraction.R  
3. Word Database.R  
4. cleaning_data.R    
5. emoticon.R  
6. score_sentiment.R  
7. func_on_tweet.R  
8. graphs.R  
9. Percentage.R    
10. level_of_sentiment.R   
11. Frequent hastags of user.R   
12. Top tweeters and timeline of particular hashtag.R  
13. wordcloud.R  

For any further queries and difficulties that you face on executing any code, feel free to post it under the issue tab above and we will get back to you as soon as possible.
