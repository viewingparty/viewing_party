require 'rails_helper'

describe 'as an authenticated user' do
    describe 'when I visit the index page' do
      before :each do
        @user = User.create(email: "admin@example.com", password: "password")

        login_as(@user)
      end

        it 'can show me the top rated movies' do
          VCR.use_cassette("movies_index") do
            visit discover_index_path

            click_on "Top Rated Movies"

            expect(current_path).to eq(movies_path)

            expect("CBS Playhouse").to appear_before("Kallagan")
          end
        end

        it 'has the top rated and search options still' do
          VCR.use_cassette("movies_index") do
            visit movies_path

            expect(page).to have_button("Top Rated Movies")
            expect(page).to have_button("Find Movies")
          end
        end
    end
end