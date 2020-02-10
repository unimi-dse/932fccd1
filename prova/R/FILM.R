FILM <-
function(year){
	upUrl=('https://www.imdb.com/search/title/?title_type=feature&release_date=')
	start=paste(year,'01','01',sep='-')
	end=paste(year,'12','31',sep='-')
	url=paste(upUrl,start,',',end,sep='')

	webpage <- read_html(url)

	titles <- html_nodes(webpage,'.lister-item-header>a')
	titles <- html_text(titles)

	vote_<-html_nodes(webpage,'.inline-block.ratings-imdb-rating>strong')
	vote<-html_text(vote_)
	vote<-as.numeric(vote)

	duration_<-html_nodes(webpage,'.text-muted>span.runtime')
	duration<-html_text(duration_)
	duration<-gsub(" min","",duration)
	duration<-as.numeric(duration)


	genre_<-html_nodes(webpage,'.text-muted>span.genre')
	genre<-html_text(genre_)
	genre<-gsub("\n","",genre)
	genre<-gsub(" ","",genre)
	genre<-as.factor(genre)
	genre<-gsub(",.*","",genre)

	numVoti_<-html_nodes(webpage,'.sort-num_votes-visible>span:nth-child(2)')
	numVoti<-html_text(numVoti_)
	numVoti<-gsub(",","",numVoti)
	numVoti<-as.numeric(numVoti)

	director_ <- html_nodes(webpage,'.text-muted+ p a:nth-child(1)')
	director <- html_text(director_)
	director<-as.factor(director)

	data<-data.frame(vote,titles,duration,genre,numVoti,director)
	return(data)
}
