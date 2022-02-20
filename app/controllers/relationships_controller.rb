class RelationshipsController < ApplicationController

  # フォローするとき
  def follow
    @user = User.find(params[:id])
    current_user.follow(params[:id])
    @user.create_notification_follow!(current_user) 
    redirect_to request.referer
  end

  # フォロー外すとき
  def unfollow
    current_user.unfollow(params[:id])
    redirect_to request.referer
  end



end
