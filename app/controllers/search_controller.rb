class SearchController < ApplicationController
    def index
        conn = Faraday.new("https://api.themoviedb.org/3") do |faraday|
            faraday.params['api_key'] = ENV['api_key']
        end
        response = conn.get("movie/75780")

        binding.pry

    end
end