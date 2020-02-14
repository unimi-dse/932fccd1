#'Film
#'
#'Gives a list of movies with titles, genre,duration,number of votes, votes score and directors name. Also plots genre with the highest score and gives a summary stat including skweness and kurtosis.
#'
#' @param year pick a date to check
#'
#' @return None
#'
#' @examples 
#'\dontrun{
#'FILM()
#' }
#'
#' @export
#'
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
	grid::current.viewport()
graph=ggplot2::ggplot(data=data,ggplot2::aes(x=duration,y=vote))+ ggplot2::geom_point(ggplot2::aes(size=as.numeric(numVoti),col=genre))
	
	max_vote=max(data$vote)
	mean_vote=mean(data$vote)
	mean_dur=mean(data$duration)
	max_dur=max(data$duration)
	min_dur=min(data$duration)
	asi_dur=moments::skewness(data$duration)
	kur_dur=moments::kurtosis(data$duration)
	max_num_vot=max(data$numVoti)
	mean_num_vot=mean(data$numVoti)
VALUES=c(max_vote,mean_vote,mean_dur,max_dur,min_dur,asi_dur,kur_dur,max_num_vot,mean_num_vot)
	um=c('/','/','min','min','min','/','/','/','/')
	STATISTICS=c('Max vote', 'Mean vote','Mean duration','Max duration','Min durtion','Skewness','Kurtosis', 'Max num votes','Mean num votes')
	stat<-data.frame(STATISTICS,VALUES,um)
	stat
	x=list(data,graph,stat)
	return(x)
	}
