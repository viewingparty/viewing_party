require 'rails_helper'

describe 'When I visit the discover index' do
    it 'can have a link to the top 40 movies' do
        visit discover_index_path

        expect(page).to have_link("Top 40 Movies")

        click_on "Top 40 Movies"

        expect(current_path).to eq(movies_path)
    end

    it 'can search for movie titles' do
        visit discover_index_path

        fill_in "search", with: "Mad Max"
        click_on "Find Movies"

        expect(current_path).to eq(movies_path)
        expect(page).to have_content("Mad Max")
        expect(page).to have_link("Top Rated Movies")
    end
end