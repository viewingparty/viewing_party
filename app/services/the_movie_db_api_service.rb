class TheMovieDbApiService 
    class << self
        def top_rated_movies
            response = conn.get("/3/discover/movie?sort_by=vote_average.desc")
            parse(response)
        end

        def find_by_title(arg)
          response = conn.get("/3/search/movie?language=en-US&query=#{arg}")
          results = parse(response)
        end

        def find_movie(id)
          response = conn.get("/3/movie/#{id}")
          response = parse(response)
        end

        def find_cast(id)
          response = conn.get("/3/movie/#{id}/credits")
          response = parse(response)
        end

        def find_reviews(id)
            response = conn.get("/3/movie/#{id}/reviews")
          response = parse(response)
        end
    private

    def parse(arg)
      JSON.parse(arg.body, symbolize_names: true)
    end

    def conn
      Faraday.new("https://api.themoviedb.org") do |faraday|
        faraday.params['api_key'] = ENV['movie_api']
      end
    end
  end
end