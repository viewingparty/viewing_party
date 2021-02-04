require 'rails_helper'


describe Film do
    it 'can create a Film object from hash data' do
        data = {"adult": false, "id": 468552, "name": "Wonder Woman Collection",
         "genres": [{"id": 14,"name": "Fantasy"}],       "overview": "Wonder Woman comes into conflict with the Soviet Union during the Cold War in the 1980s and finds a formidable foe by the name of the Cheetah.",
         "original_title": "Wonder Woman 1984", "title": "Wonder Woman 1984", 
         "runtime": 151, "vote_average": 7, "popularity": 2923.424
         }

        film = Film.new(data)
        expect(film).to be_a(Film)
        expect(film.title).to eq(data[:title])
    end
end