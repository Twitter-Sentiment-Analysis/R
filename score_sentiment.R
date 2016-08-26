score.sentiment = function(sentences, pos.words, neg.words, .progress='none')
{
	require(plyr)
	require(stringr)
	list=lapply(sentences, function(sentence, pos.words, neg.words)
	{
		sentence = gsub('[[:punct:]]',' ',sentence)
		sentence = gsub('[[:cntrl:]]','',sentence)
		sentence = gsub('\\d+','',sentence)
		sentence = gsub('\n','',sentence)

		sentence = tolower(sentence)
		word.list = str_split(sentence, '\\s+')
		words = unlist(word.list)
		pos.matches = match(words, pos.words)
		neg.matches = match(words, neg.words)
		pos.matches = !is.na(pos.matches)
		neg.matches = !is.na(neg.matches)
		pp=sum(pos.matches)
		nn = sum(neg.matches)
		score = sum(pos.matches) - sum(neg.matches)
		list1=c(score, pp, nn)
		return (list1)
	}, pos.words, neg.words)
	score_new=lapply(list, `[[`, 1)
	pp1=score=lapply(list, `[[`, 2)
	nn1=score=lapply(list, `[[`, 3)

	scores.df = data.frame(score=score_new, text=sentences)
	positive.df = data.frame(Positive=pp1, text=sentences)
	negative.df = data.frame(Negative=nn1, text=sentences)

	list_df=list(scores.df, positive.df, negative.df)
	return(list_df)
}

