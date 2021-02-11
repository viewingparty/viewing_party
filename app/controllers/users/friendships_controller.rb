class Users::FriendshipsController < Users::BaseController
  def create
    friend = User.find_by(email: params[:email])
    Friendship.create!(user: current_user, friend: friend)
    redirect_to user_dashboard_path(current_user)
  end

  def update
    invite = Friendship.find(params[:friendship_id])
    invite.update(friendship_params)
    redirect_to user_dashboard_path(current_user)
  end

  private

  def friendship_params
    params.permit(:status)
  end
end
