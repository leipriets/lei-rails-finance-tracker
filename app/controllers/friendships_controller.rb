class FriendshipsController < ApplicationController
  def create
    
    follow_friend = current_user.friendships.build(friend_id: params[:friend])

    if follow_friend.save
      flash[:notice] = "Following friend"
    else
      flash[:alert] = "There was something wrong with the tracking request"
    end

    redirect_to my_friends_path

  end

  def destroy
    friendship = current_user.friendships.where(friend_id: params[:id]).first
    friendship.destroy
    flash[:notice] = "Stopped following"
    redirect_to my_friends_path
  end
end
