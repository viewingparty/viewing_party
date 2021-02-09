require 'rails_helper'


describe Genre do
    it 'can create a Film object from hash data' do
        data = {"id" => 1, "name" => "Action"}

        genre = Genre.new(data)
        expect(genre).to be_a(Genre)
        expect(genre.name).to eq(data[:name])
    end
end