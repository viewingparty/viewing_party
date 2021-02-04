require 'rails_helper'

describe Film do
    it 'can create a Film object from hash data' do
        data = { 
            title: "title",
            original_title: "original_title",
            adult: "adult",
            id: "id",
            runtime: "runtime",
            popularity: "popularity",
            vote_average: "vote_average",
            overview: "overview",
            genres: "genres"
         }
        cast = "Big"
        reviews = "Lots"

        film = Film.new(data, cast, reviews)

        expect(film.title).to eq(data[:title])
        expect(film.original_title).to eq(data[:original_title])
        expect(film.adult).to eq(data[:adult])
        expect(film.api_id).to eq(data[:id])
        expect(film.runtime).to eq(data[:runtime])
        expect(film.popularity).to eq(data[:popularity])
        expect(film.vote_average).to eq(data[:vote_average])
        expect(film.overview).to eq(data[:overview])
        expect(film.genres).to eq(data[:genres])
        expect(film.cast).to eq(cast)
        expect(film.reviews).to eq(reviews)
    end
end