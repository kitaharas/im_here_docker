class HomeController < ApplicationController
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
  end
  
  def genre
    @user = User.new
  end
  



end
