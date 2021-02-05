class TheMovieDbApiService 
    class << self
        def top_rated_movies
            response1 = faraday.get("/3/movie/top_rated?certification_country=US&page=1")
            response2 = faraday.get("/3/movie/top_rated?certification_country=US&page=2")
            [parse(response1)[:results], parse(response2)[:results]].flatten
        end

        def  movie_genre_select
          response = faraday.get("/3/genre/movie/list")
          parse(response)
        end

        def movies_by_genre(arg)
          response = faraday.get("/3/discover/movie?genre=#{arg}")
          results = parse(response)
        end

        def find_by_title(arg)
          response = faraday.get("/3/search/movie?certification_country=US&language=en-US&query=#{arg}")
          results = parse(response)
        end

        def find_movie(id)
          response = faraday.get("/3/movie/#{id}")
          response = parse(response)
        end

        def find_cast(id)
          response = faraday.get("/3/movie/#{id}/credits")
          response = parse(response)
        end

        def find_reviews(id)
            response = faraday.get("/3/movie/#{id}/reviews")
          response = parse(response)
        end
    private

    def parse(arg)
      JSON.parse(arg.body, symbolize_names: true)
    end

    def faraday
      Faraday.new("https://api.themoviedb.org") do |faraday|
        faraday.params['api_key'] = ENV['movie_api']
      end
    end
  end
end