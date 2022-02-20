class HomeController < EventsController
  
  # require "net/http"
  # require "uri"
  # require "json"


  

  before_action :set_user_new,only: %i[index about feel genre]

  def index
    if logged_in?()
      unchecked_notifications()
    end
  end
  
  def about
  end
  
  def feel
    public_method(:feel).super_method.call
  end
  
  def feel_page
    @event = Event.where(feel_id: params[:id]).order(created_at: :desc).all
    @feel = Feel.find(params[:id])
  end

  def genre
    # 親のindexを呼び出す
    public_method(:genre).super_method.call
  end

  def genre_page
    # Event.where(genre_id: g).order("RANDOM()").limit(18)
    @event = Event.where(genre_id: params[:id]).order(created_at: :desc).all
    @genre = Genre.find(params[:id])
    # @genre = Genre.find(params[:id])
    # @events = @genre.events.order(created_at: :desc).all
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

  private
    def set_user_new
      @user = User.new
    end


end
