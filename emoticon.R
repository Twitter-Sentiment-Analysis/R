#s <- searchTwitter('#emoticons', cainfo="cacert.pem")
#converts to data frame
df <- do.call("rbind", lapply(rahul.tweets, as.data.frame))
#remove odd characters
df$text <- sapply(df$text,function(row) iconv(row, "latin1", "ASCII", sub=""))
df$text = gsub("(f|ht)tp(s?)://(.*)[.][a-z]+", "", df$text)
sample <- df$text
