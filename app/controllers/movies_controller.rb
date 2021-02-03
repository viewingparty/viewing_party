class MoviesController < ApplicationController
    def index
        @movies = MovieFacade.search_movies(params)
    end

    def show
        @movie = MovieFacade.find_movie(params[:id])
    end
end