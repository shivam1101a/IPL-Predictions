ipl1<-read.csv("E:/R-practice/iplallseasons_refined.csv")
View(ipl1)
library(ggplot2)
#ipl2<-ipl1[1:56,c(3,5,6,11)]
ipl4<-select(ipl1,3,5,6,11)
View(ipl4)
#------------------
colors = c("green","red")
teams <- c("KXIP","DC","KKR","MI","RR","RCB","CSK","SRH")
result <- c("WIN","LOSS")

# Create the matrix of the values.
Values <- matrix(c(7,8,13,17,23,9,21,12,14,6,11,14,18,4,9,6), nrow = 2, ncol = 8, byrow=TRUE)

# Give the chart file a name
png(file = "barchart_stacked.png")

# Create the bar chart
barplot(Values, main = "HOME GROUND+TOSS WIN THEN RESULT COMPARISON", names.arg = teams, xlab = "TEAMS", ylab = "TOSS WIN", col = colors)

# Add the legend to the chart
legend("topleft", regions, cex = 1.3, fill = colors)

# Save the file
dev.off()

#----------------------

#------------------------
colors = c("green","red")
teams <- c("KXIP","DC","KKR","MI","RR","RCB","CSK","SRH")
result <- c("WIN","LOSS")

# Create the matrix of the values.
Values <- matrix(c(7,8,13,17,23,9,21,12,14,6,11,14,18,4,9,6), nrow = 2, ncol = 8, byrow=TRUE)

# Give the chart file a name
png(file = "barchart_stacked.png")

# Create the bar chart
barplot(Values, main = "(HOME GROUND + TOSS WIN) THEN RESULT COMPARISON", names.arg = teams, xlab = "TEAMS", ylab = "TOSS WIN", col = colors)

# Add the legend to the chart
legend("topleft", result, cex = 1.3, fill = colors)

# Save the file
dev.off()
#-----------------------
ipl2<-na.omit(ipl2)#remove the row with NA

filter(ipl4,Match_venue %in% c("Punjab Cricket Association Stadium, Mohali, Chandigarh"))->ipl3
View(ipl3)

filter(ipl4,Match_venue %in% c("Feroz Shah Kotla, Delhi"))->ipl3
View(ipl3)

filter(ipl4,Match_venue %in% c("Eden Gardens, Kolkata"))->ipl3
View(ipl3)

filter(ipl4,Match_venue %in% c("Wankhede Stadium, Mumbai"))->ipl3
View(ipl3)
filter(ipl4,Match_venue %in% c("Dr DY Patil Sports Academy, Mumbai"))->ipl3
View(ipl3)

filter(ipl4,Match_venue %in% c("Sawai Mansingh Stadium, Jaipur"))->ipl3
View(ipl3)

filter(ipl4,Match_venue %in% c("MA Chidambaram Stadium, Chepauk, Chennai"))->ipl3
View(ipl3)

filter(ipl4,Match_venue %in% c("M Chinnaswamy Stadium, Bangalore"))->ipl3
View(ipl3)

filter(ipl4,Match_venue %in% c("Rajiv Gandhi International Stadium, Uppal, Hyderabad"))->ipl3
View(ipl3)

h<-c(35,68,72,68,40,69,49,38)
png(file="barchart.png")
barplot(h)
dev.off()
#cars1<-cars[1:98,c(1,2,3,5,11,16,18)]
#View(cars1)

#select function

select(hflights,FlightNum,ArrTime,DepTime)->flight1  #flightNm is col. name
View(flight1)
select(hflights,5,6,8)->flight1  #column number
select(hflights,contains("Time"))->flight1  #col which contains time
select(hflights,Year:ArrTime)->flight1#col. from year to Arrtime
select(hflights,1:6)->flight1#first 6 col.
select(hflights,starts_with("Day"),ends_with("Time"))->flight1#all

#
library(dplyr)
mutate(ipl2,score1=Team1_score)->ipl2

#mutate
#bring the new column

mutate(hflights,ActualGroundTime=ActualElapsedTime-AirTime)->flight2#ActualGroundTime is new Col.
View(flight2)
mutate(flight2,AverageSpeed=Distance/AirTime *60)->flight2
mutate(flight2,TotalTaxii=TaxiIn+TaxiOut)->flight1
mutate(flight2,TimeLoss=ArrDelay+DepDelay)->flight1
#

#filter
#filtering rows based on a specific condition

filter(hflights,Distance>3000)->flight3
View(flight3)
range(flight3$Distance)
filter(hflights,UniqueCarrier %in% c("OO","US","AA"))->flight3
filter(hflights,TaxiIn+TaxiOut>AirTiME)->flight3
filter(hflights,DepTime<500|ArrTime>2200)->flight3#500 is 5:00
filter(hflights,Dest=="JFK"&Cancelled==1)->flight3
#

#
movie<-data.matrix(movie_metadata)#To perform certain operation
movie<-na.omit(movie)#remove the row with NA
sample<-movie[sample(nrow(movie),500),]#Random 500 rows
View(sample)

sample_short<-sample[,c(9,23)]#col. number
View(sample_short)
sample_matrix<-data.matrix(sample_short)
#

#
facebook<-reddit[1:50,c(5,6,8,14,25,28)]#we are focusing on facebook like and the colomn number is mentioned
View((facebook))  #viewinG  1ST 50 OBSERVATIONS


ipl2$Winning_margin[which(is.na(ipl2$Winning_margin))]
ipl2$Winning_margin<-sub("NA,"draw",ipl2$Winning_margin)


#DATA CLEANING
reddit$movie_title<-sub("?","",reddit$movie_title)  #REPLACE ? WITH " " IN MOVIE TITLE
row.names(facebook)<-reddit$movie_title[1:50] #BY MOVIE NAME IN FRONT
View(facebook)
#

#
#renaming columns
colnames(pokemon)[2]<-"Primary_type"
colnames(pokemon)[3]<-"Secondary_type"

#as.factor(pokemon$isLegendary)->pokemon$isLegendary

#
#seleting Grass pokemon
library(dplyr)
pokemon %>% filter(Primary_type=="Grass")->Grass_pokemon
Grass_pokemon %>% filter(Secondary_type=="Poison")->Grass_Poison_pokemon
range(Grass_Poison_pokemon$Speed)
Grass_Poison_pokemon %>% filter(Speed==90)->My_Grass_pokemon
View(My_Grass_pokemon)
#

#
