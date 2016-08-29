#Good

Sc = table_final$Score

#Output of following is FALSE or TRUE
good <- sapply(Sc, function(Sc) Sc <= 3 && Sc > 0)
#Converts to actual value
Sc[good]
list_good = Sc[good]
value_good = length(list_good)

#Very good

vgood <- sapply(Sc, function(Sc) Sc > 3 && Sc <6)
#Converts to actual value
Sc[vgood]
list_vgood = Sc[vgood]
value_vgood = length(list_vgood)

#Outstanding

vvgood <- sapply(Sc, function(Sc) Sc >= 6)
#Converts to actual value
Sc[vvgood]
list_vvgood = Sc[vvgood]
value_vvgood = length(list_vvgood)

#Bad : Unsatisfactory

#Output of following is FALSE or TRUE
bad <- sapply(Sc, function(Sc) Sc >= -3 && Sc < 0)
#Converts to actual value
Sc[bad]
list_bad = Sc[bad]
value_bad = length(list_bad)

#Very bad : Poor

#Output of following is FALSE or TRUE
vbad <- sapply(Sc, function(Sc) Sc < -3 && Sc > -6)
#Converts to actual value
Sc[vbad]
list_vbad = Sc[vbad]
value_vbad = length(list_vbad)

#Awful

vvbad <- sapply(Sc, function(Sc) Sc <= -6)
#Converts to actual value
Sc[vvbad]
list_vvbad = Sc[vvbad]
value_vvbad = length(list_vvbad)

#Neutral
neutral <- sapply(Sc, function(Sc) Sc == 0) 
list_neutral = Sc[neutral]
value_neutral = length(list_neutral)

library(plotrix)
slices1 <- c(value_good, value_vvbad, value_bad, value_vgood, value_vbad, value_neutral, value_vvgood )
lbls1 <- c("Good", "Awful", "Unsatisfactory", "Great", "Poor", "Neutral", "Outstanding")
pct <- round(slices1/sum(slices1)*100) #Percentage
lbls1 <- paste(lbls1, pct) # add percents to labels 
lbls1 <- paste(lbls1,"%",sep="") # ad % to labels 
pie(slices1,labels = lbls1, col=rainbow(length(lbls1)),
  	 main="Number of tweets with particular sentiment")
