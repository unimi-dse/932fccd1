PLOT <-
function(data){
	url=('https://www.imdb.com/search/title/?title_type=feature&release_date=')
	
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
	
	titles[1:42]
	director[1:42]
	duration[1:42]
	genre[1:42]
	titles=titles[1:42]
	duration=duration[1:42]
	genre=genre[1:42]
	director=director[1:42]
	data<-data.frame(vote,titles,duration,genre,numVoti,director)
	grid::current.viewport()
	ggplot2::ggplot(data=data,ggplot2::aes(x=duration,y=vote))+ ggplot2::geom_point(ggplot2::aes(size=as.numeric(numVoti),col=genre))
	}
