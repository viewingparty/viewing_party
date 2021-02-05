class Users::FriendshipsController < ApplicationController
  def create
    invitee = User.find(params[:user])
    if params[:status] == 'accepted'
      Friendship.create(user: current_user, friend: invitee, status: :accepted)
      friendship = Friendship.find_by(user: invitee, friend: current_user)
      friendship.update(status: :accepted)
    else
      Friendship.create(user: current_user, friend: params[:friend])
    end
    redirect_to user_dashboard_path(current_user)
  end

  def update
    invite = Friendship.find(params[:friendship_id])
    invite.update(friendship_params)
  end

  private

  def friendship_params
    params.permit(:status)
  end
end
