class MovieFacade
  class << self
    def search_movies(params)
      if params[:query].present?
        data = TheMovieDbApiService.find_by_title(params[:query])
        movies(data)
      elsif params[:top_rated].present?
        data = TheMovieDbApiService.top_rated_movies
        movies(data)
      end
    end


    def movies(data)
        data[:results].map do |result|
            Film.new(result)
        end
    end
  end
end