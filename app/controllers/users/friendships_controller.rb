class Users::FriendshipsController < ApplicationController

  def create
    invitee = User.find(params[:user])
    if params[:status] == "Accept"
      Friendship.create(user: current_user, friend: invitee, status: :accepted)
      friendship = Friendship.find_by(user: invitee, friend: current_user)
      friendship.update(status: :accepted)
    else
      Friendship.create(user: current_user, friend: params[:friend])
    end
    redirect_to user_dashboard_path(current_user)
  end
end