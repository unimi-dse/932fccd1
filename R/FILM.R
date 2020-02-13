#' @param year gives a list of movies with titles, genre,duration,number of votes, votes score and director,s name
#' @return None
#' @examples
#' FILM()
#' @export
FILM <-
function(year){
	upUrl=('https://www.imdb.com/search/title/?title_type=feature&release_date=')
	start=paste(year,'01','01',sep='-')
	end=paste(year,'12','31',sep='-')
	url=paste(upUrl,start,',',end,sep='')

	webpage <- xml2::read_html(url)

	titles <- rvest::html_nodes(webpage,'.lister-item-header>a')
	titles <- rvest::html_text(titles)

	vote_<-rvest::html_nodes(webpage,'.inline-block.ratings-imdb-rating>strong')
	vote<-rvest::html_text(vote_)
	vote<-as.numeric(vote)

	duration_<-rvest::html_nodes(webpage,'.text-muted>span.runtime')
	duration<-rvest::html_text(duration_)
	duration<-gsub(" min","",duration)
	duration<-as.numeric(duration)


	genre_<-rvest::html_nodes(webpage,'.text-muted>span.genre')
	genre<-rvest::html_text(genre_)
	genre<-gsub("\n","",genre)
	genre<-gsub(" ","",genre)
	genre<-as.factor(genre)
	genre<-gsub(",.*","",genre)

	numVoti_<-rvest::html_nodes(webpage,'.sort-num_votes-visible>span:nth-child(2)')
	numVoti<-rvest::html_text(numVoti_)
	numVoti<-gsub(",","",numVoti)
	numVoti<-as.numeric(numVoti)

	director_ <-rvest::html_nodes(webpage,'.text-muted+ p a:nth-child(1)')
	director <-rvest::html_text(director_)
	director<-as.factor(director)

	data<-data.frame(vote,titles,duration,genre,numVoti,director)
	return(data)
}
