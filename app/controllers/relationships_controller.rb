class RelationshipsController < ApplicationController

  # フォローするとき
  def follow
    current_user.follow(params[:id])
    redirect_to request.referer
  end

  # フォロー外すとき
  def unfollow
    current_user.unfollow(params[:id])
    redirect_to request.referer
  end

  # フォロー一覧
  def followings
    user = User.find(params[:user_id])
    @users = user.followings
  end

  # フォロワー一覧
  def followers
    user = User.find(params[:user_id])
    @users = user.followers
  end
end
