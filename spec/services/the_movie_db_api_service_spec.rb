require 'rails_helper'

describe TheMovieDbApiService do
  it 'can find top rated movies' do
    VCR.use_cassette("movies_index") do
      top = TheMovieDbApiService.top_rated_movies
      expect(top[:results].first[:title]).to eq("Looks Like it Was Yesterday.")
    end
  end

  it 'can find by title' do
    VCR.use_cassette("find_by_title") do
      find = TheMovieDbApiService.find_by_title("Mad Max")

      expect(find[:results].first[:title]).to eq("Mad Max: Fury Road")
    end
  end

  it 'can find movie by id' do
    VCR.use_cassette("find_movie") do
      movie = TheMovieDbApiService.find_movie(792897)

      expect(movie[:title]).to eq("CBS Playhouse: Shadow Game")
    end
  end

  it 'can find_cast' do
    VCR.use_cassette("find_cast") do
      cast = TheMovieDbApiService.find_cast(792897)

      expect(cast[:cast].first[:name]).to eq("Daniel Massey")
    end
  end

  it 'can find reviews' do
    VCR.use_cassette("find_reviews") do
      reviews = TheMovieDbApiService.find_reviews(547016)

      expect(reviews[:results].first[:author]).to eq("MovieGuys")
    end
  end
end