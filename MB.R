batting <- read.csv('Batting.csv')
salaries <- read.csv('Salaries.csv')
head(salaries)
str(salaries)
batting$playerID <- factor(batting$playerID)
batting$teamID <- factor(batting$teamID)
batting$lgID <- factor(batting$lgID)
batting <- subset(batting,batting$yearID >= 1985)
summary(batting)
batting$BA <- batting$H/batting$AB
batting$X1B <- batting$H-batting$X2B-batting$X3B-batting$HR
batting$SLG <- (batting$X1B + (2*batting$X2B) +(3*batting$X3B) + (4*batting$HR))/batting$AB
batting$OBP <- (batting$BB+batting$HBP+batting$H)/(batting$AB+batting$BB+batting$HBP+batting$SF)
summary(batting)
merge(batting,salaries,by.x = 'playerID',by.y = 'yearID')
summary(batting)
combo <- merge(batting,salaries,by=c('playerID','yearID'))
summary(combo)
lost_players <- subset(combo,playerID %in%c('damonjo01','giambja01','saenzol01'))
lost_players
lost_players <- subset(lost_players,yearID == 2001)
lost_players <- select(lost_players,-c(stint,teamID.x,lgID.x,G,G_batting,RBI, SB, CS,BB,SO,IBB,HBP,SH,SF,GIDP,G_old, X1B,teamID.y,lgID.y ,salary))
summary(lost_players)
avail <- subset(combo,yearID==2001)
avail <- subset(avail,salary < 8000000, OBP>2)
pos <- head(arrange(avail,desc(OBP)),10)
pos <- pos[,c('playerID','OBP','AB','salary')]
pos
avail <- subset(avail,AB>=500)
pos <- head(arrange(avail,desc(OBP)),10)
pos <- pos[,c('playerID','OBP','AB','salary')]
pos
