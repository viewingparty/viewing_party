class PartiesController < ActionController::Base
  def new
    @movie = Movie.create!(title: params[:title], duration: params[:duration], api_id: params[:api_id])
    @party = Party.new(duration: @movie[:duration])
  end

  def create
    current_user.parties.create(party_params)
    redirect_to user_dashboard_path(current_user)
  end

  private
  def party_params
    params.require(:party).permit(:title, :duration, :movie_id)
  end
end