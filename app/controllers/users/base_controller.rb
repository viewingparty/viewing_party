class Users::BaseController < ApplicationController
  before_action :require_login

  private
  def require_login
    unless current_user
      flash[:error] = "You must be logged in to access this section"
      redirect_to root_path
    end
  end

  def check_user
    unless current_user.id == params[:user_id].to_i
      flash[:error] = "You must be logged in to access this section"
      redirect_to root_path
    end
  end
end