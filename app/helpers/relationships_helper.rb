module RelationshipsHelper

  def follower
    @user = User.find(params[:id])
    followers = @user.followings.where.not(id: current_user.id)
  end

end
