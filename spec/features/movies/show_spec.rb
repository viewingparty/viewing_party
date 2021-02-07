require 'rails_helper'

describe 'as an auth user' do
    describe 'when I visit the movie show page' do

        it 'can show me that movies stats' do
          VCR.use_cassette("find_movie") do
            movie = MovieFacade.find_movie(792897)
            @user = User.create(email: "admin@example.com", password: "password")
            login_as(@user)
            visit movie_path(movie.api_id)

            expect(page).to have_content("#{movie.title}")
            expect(page).to have_content("#{movie.overview}")
          end
        end

        it 'can create a party' do
          VCR.use_cassette("find_movie") do
            movie = MovieFacade.find_movie(792897)
            @user = User.create(email: "admin@example.com", password: "password")
            login_as(@user)
            visit movie_path(movie.api_id)

            expect(page).to have_button("Create A Party")
          end
        end
    end
end