#s <- searchTwitter('#emoticons', cainfo="cacert.pem")
df <- do.call("rbind", lapply(rahul.tweets, as.data.frame))
df$text <- sapply(df$text,function(row) iconv(row, "latin1", "ASCII", sub=""))

