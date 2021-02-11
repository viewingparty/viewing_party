class MoviesController < Users::BaseController
  def index
    @genres = MovieFacade.genres
    @movies = MovieFacade.search_movies(params)
  end

  def show
    @movie = MovieFacade.find_movie(params[:id])
  end
end
