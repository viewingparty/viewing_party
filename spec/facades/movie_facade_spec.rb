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

    it 'can collect genres' do
        VCR.use_cassette("genres_collectin") do
            genres = MovieFacade.genres

            expect(genres).to be_an(Array)
            expect(genres.first.id).to be_an(Integer)
            expect(genres.first.name).to eq("Action")
        end
    end

    it 'can search by genre' do
        VCR.use_cassette("search_by_genre") do
            params = {genre: "Action"}
            collection = MovieFacade.search_movies(params)

            expect(collection).to be_an(Array)
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