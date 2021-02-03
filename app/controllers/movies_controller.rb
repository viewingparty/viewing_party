class MoviesController < ApplicationController
    def index
        @movies = MovieFacade.search_movies(params)
    end
end