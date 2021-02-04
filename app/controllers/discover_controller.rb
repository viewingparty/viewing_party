class DiscoverController < ApplicationController
    before_action :authenticate_user!
    def index
      @genres = MovieFacade.genres
    end
end
