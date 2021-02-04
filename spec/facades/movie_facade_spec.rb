require 'rails_helper'

describe MovieFacade do
    it 'can return a single movie' do
      VCR.use_cassette("find_movie") do
        movie = MovieFacade.find_movie(792897)
        expect(movie.vote_average).to eq(10.0)
      end
    end

    it 'can search movies' do
      VCR.use_cassette("find_by_title") do
        params = {query: "Mad Max"}
        movies = MovieFacade.search_movies(params)

        expect(movies.first.title).to eq("Mad Max: Fury Road")
      end
    end

    it 'can show top_rated' do
        VCR.use_cassette("movies_index") do
          params = {top_rated: true}
          movies = MovieFacade.search_movies(params)

          expect(movies.first.title).to eq("Le Temps Passe")
        end
    end
end