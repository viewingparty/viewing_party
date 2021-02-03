require 'rails_helper'

describe 'When I visit the discover index' do
    it 'can have a link to the top 40 movies' do
      VCR.use_cassette("movies_index") do
        visit discover_index_path

        expect(page).to have_button("Top Rated Movies")

        click_on "Top Rated Movies"

        expect(current_path).to eq(movies_path)
      end
    end

    it 'can search for movie titles' do
      VCR.use_cassette("search_movies") do
        visit discover_index_path

        fill_in :query, with: "Mad Max"
        click_on "Find Movies"

        expect(current_path).to eq(movies_path)
        expect(page).to have_content("Mad Max")
      end
    end
end