class PartiesController < ActionController::Base
  before_action :set_movie, only: [:new, :create]
  # after_action :add_movie_to_party, only: [:create]
  def new
    session[:movie] = {title: params[:title],
      duration: params[:duration],
      api_id: params[:api_id]
    }
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
    if !(@movie = Movie.find_by(title: session[:movie][:title]))
      @movie = Movie.create(session[:movie])
    end
  end
end