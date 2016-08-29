#Good

posSc = table_final$Positive

#Output of following is FALSE or TRUE
good <- sapply(posSc, function(posSc) posSc < 3)
#Converts to actual value
posSc[good]
list_good = posSc[good]
value_good = length(list_good)

#Very good

vgood <- sapply(posSc, function(posSc) posSc >= 3 && posSc <6)
#Converts to actual value
posSc[vgood]
list_vgood = posSc[vgood]
value_vgood = length(list_vgood)

#Outstanding

vvgood <- sapply(posSc, function(posSc) posSc >= 6)
#Converts to actual value
posSc[vvgood]
list_vvgood = posSc[vvgood]
value_vvgood = length(list_vvgood)

#Bad : Unsatisfactory

negSc = table_final$Negative

#Output of following is FALSE or TRUE
bad <- sapply(negSc, function(negSc) negSc < 3)
#Converts to actual value
negSc[bad]
list_bad = negSc[bad]
value_bad = length(list_bad)

#Very bad : Poor

#Output of following is FALSE or TRUE
vbad <- sapply(negSc, function(negSc) negSc >= 3 && negSc < 6)
#Converts to actual value
negSc[vbad]
list_vbad = table_final$Negative[vbad]
value_vbad = length(list_vbad)

#Awful

vvbad <- sapply(negSc, function(negSc) negSc >= 6)
#Converts to actual value
negSc[vvbad]
list_vvbad = negSc[vvbad]
value_vvbad = length(list_vvbad)

library(plotrix)
slices <- c(value_good, value_vvbad,  value_vgood, value_vvgood , value_bad, value_vbad)
lbls <- c("Good", "Awful", "Great", "Outstanding", "Unsatisfactory", "Poor")
pct <- round(slices/sum(slices)*100)
lbls <- paste(lbls, pct) # add percents to labels 
lbls <- paste(lbls,"%",sep="") # ad % to labels 
pie(slices,labels = lbls, col=rainbow(length(lbls)),
  	 main="Pie Chart of Countries")