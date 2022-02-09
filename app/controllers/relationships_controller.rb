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

end
