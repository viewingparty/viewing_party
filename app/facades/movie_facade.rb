class MovieFacade
  class << self
    def search_movies(params)
      if params[:query].present?
        data = TheMovieDbApiService.find_by_title(params[:query])[:results]
        movies(data.first(ENV['search_limit'].to_i))
      elsif params[:top_rated].present?
        data = TheMovieDbApiService.top_rated_movies
        movies(data)
      elsif params[:genre].present?
        data = TheMovieDbApiService.movies_by_genre(params[:genre])[:results]
        movies(data)
      end
    end

    def genres
      data = TheMovieDbApiService.movie_genre_select[:genres]
      data.map do |genre|
        Genre.new(genre)
      end
    end

    def find_movie(id)
      movie = TheMovieDbApiService.find_movie(id)
      cast = TheMovieDbApiService.find_cast(id)[:cast]
      reviews = TheMovieDbApiService.find_reviews(id)[:results]
      Film.new(movie, cast, reviews)
    end

    def movies(data)
      data.map do |result|
        Film.new(result)
      end
    end
  end
end
