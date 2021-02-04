class PartiesController < ActionController::Base
  before_action :create_movie, only: [:create]
  def new
    session[:movie] = {title: params[:title],
      duration: params[:duration],
      api_id: params[:api_id]
    }
    @party = Party.new(duration: params[:duration])
  end
  
  def create
    # binding.pry
    current_user.parties.create(party_params.merge(movie: @movie))
    redirect_to user_dashboard_path(current_user)
  end

  private
  def party_params
    params.require(:party).permit(:title, :duration, :time)
  end

  def create_movie
    if !(@movie = Movie.find_by(title: session[:movie][:title]))
      @movie = Movie.create(session[:movie])
    end
  end
end