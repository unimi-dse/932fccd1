PLOT <-
function(data){
	graph=ggplot2::ggplot(data,ggplot2::aes(x='duration',y='vote'))+
	ggplot2::geom_point(ggplot2::aes(size='numVoti',col='genre'))
	return(graph)	
	}
