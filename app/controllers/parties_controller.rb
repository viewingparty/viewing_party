class PartiesController < ApplicationController
  before_action :set_movie, only: %I[new create]
  # after_action :add_movie_to_party, only: [:create]
  def new
    session[:movie] = { title: params[:title],
                        duration: params[:duration],
                        sapi_id: params[:api_id] }
    @party = Party.new(duration: params[:duration])
  end

  def create
    pc = PartyCreator.new(params, current_user, @movie)
    pc.make_the_party
    redirect_to user_dashboard_path(current_user)
  end

  private

  def party_params
    params.require(:party).permit(:title, :duration, :time)
  end

  def set_movie
    return @movie = Movie.create(session[:movie]) unless
    (@movie = Movie.find_by(title: session[:movie][:title]))
  end
end
