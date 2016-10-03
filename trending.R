dat <- cbind(getTrends(1)$name)
dat2 <- unlist(strsplit(dat, split=", "))
dat3 <- grep("dat2", iconv(dat2, "latin1", "ASCII", sub="dat2"))
dat4 <- dat2[-dat3]
dat4