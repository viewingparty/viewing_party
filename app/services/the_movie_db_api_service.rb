class TheMovieDbApiService
  class << self
    def top_rated_movies(response = [], iterations = 0)
      if response.length * 20 >= ENV['top_rated_limit'].to_i
        response.flatten.first(ENV['top_rated_limit'].to_i)
      else
        response << parse(faraday.get("/3/movie/top_rated?certification_country=US&page=#{iterations += 1}"))[:results]
        top_rated_movies(response, iterations)
      end
    end

    def movie_genre_select(*)
      faraday.get('/3/genre/movie/list')
    end

    def movies_by_genre(arg)
      faraday.get("/3/discover/movie") do |req|
        req.params['with_genres'] = arg.first
        req.params['sort_by']= 'vote_average.desc'
      end
    end
    
    def find_by_title(arg)
      faraday.get("/3/search/movie") do |req|
        req.params['certification_country'] = "US"
        req.params['language'] = "en-US"
        req.params['query'] = arg.first
      end
    end

    [:movie_genre_select, :movies_by_genre, :find_by_title].each do |call|
      alias_method "original_#{call.to_s}".to_sym {|*arg|}, call

      define_method call do |*arg|
        parse(send("original_#{call.to_s}".to_sym, [*arg]))
      end
    end

    def find_movie(id)
      response = faraday.get("/3/movie/#{id}")
      pazxrse(response)
    end

    def find_cast(id)
      response = faraday.get("/3/movie/#{id}/credits")
      parse(response)
    end

    def find_reviews(id)
      response = faraday.get("/3/movie/#{id}/reviews")
      parse(response)
    end

    private

    def parse(arg)
      JSON.parse(arg.body, symbolize_names: true)
    end

    def faraday
      Faraday.new('https://api.themoviedb.org') do |faraday|
        faraday.params['api_key'] = ENV['movie_api']
      end
    end
  end
end
