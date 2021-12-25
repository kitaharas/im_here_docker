class HomeController < EventsController
  def index
    p "-------------------"
    p params
    p "-------------------"
    @user = User.new
  end
  
  
  
  def about
    @user = User.new
  end
  
  def feel
    @user = User.new
    public_method(:feel).super_method.call
  end
  
  def genre
    @user = User.new
    # 親のindexを呼び出す
    public_method(:genre).super_method.call
  end
  
  def login
    @user = User.find_by(email: params[:email],
      password: params[:password])
      if @user
        flash[:notice] = "ログインしました"
        redirect_to root_path
      else
        redirect_to root_path
        flash[:notice] = "ログインしてません"
        p "-------------------"
        p params
        p "-------------------"

    end
  end




end
