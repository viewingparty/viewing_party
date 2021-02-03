require 'rails_helper'

describe 'as an authenticated user' do
    describe 'when I visit the index page' do
        it 'can show me the top rated movies' do
            visit discover_index_path

            click_on "Top Rated Movies"

            expect(current_path).to eq(movies_path)

            expect("CBS Playhouse").to appear_before("Kallagan")
        end
    end
end