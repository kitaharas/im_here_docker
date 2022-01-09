module RelationshipsHelper

  def following
    @user = User.find(params[:id])
    followers = @user.followings.where.not(id: current_user.id)
    # p "------------"
    # p followers
    # p "------------"
  end

  def followers
    @user = User.find(params[:id])
    followers = @user.followers.where.not(id: current_user.id)
  end



end
