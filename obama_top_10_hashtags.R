tw = userTimeline("BarackObama", cainfo = x1, n = 3200)
tw = twListToDF(tw)
vec1 = tw$text
 
extract.hashes = function(vec){
 
hash.pattern = "#[[:alpha:]]+"
have.hash = grep(x = vec, pattern = hash.pattern)
 
hash.matches = gregexpr(pattern = hash.pattern,
                        text = vec[have.hash])
extracted.hash = regmatches(x = vec[have.hash], m = hash.matches)
 
df = data.frame(table(tolower(unlist(extracted.hash))))
colnames(df) = c("tag","freq")
df = df[order(df$freq,decreasing = TRUE),]
return(df)
}
 
dat = head(extract.hashes(vec1),50)
dat2 = transform(dat,tag = reorder(tag,freq))
 
 
library(ggplot2)
 
p = ggplot(dat2, aes(x = tag, y = freq)) + geom_bar(stat="identity", fill = "blue")
p + coord_flip() + labs(title = "Hashtag frequencies in the tweets of the Obama team (@BarackObama)")