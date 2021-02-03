class PartiesController < ActionController::Base
  def new
    @party = Party.new(title: params[:title], duration: params[:duration])
  end
end