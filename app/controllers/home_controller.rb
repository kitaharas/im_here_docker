class HomeController < ApplicationController
  def index
    p "-------------------"
    p params
    p "-------------------"
    @user = User.new
  end
  
  
  
  def about
  end
  
  def feel
  end
  
  def genre
  end
  



end
