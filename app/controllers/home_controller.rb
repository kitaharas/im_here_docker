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
  



end
