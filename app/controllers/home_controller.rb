class HomeController < EventsController
  
  require "net/http"
  require "uri"
  require "json"


  

  before_action :set_user_new,only: %i[index about feel genre]

  def zoom

    # @user = Auth::user
    # CLIENTID="
    # REDIRECTURI="http://localhost:3000/zoomoatuh/check";
    @REQUESTURI="https://zoom.us/oauth/authorize?response_type=code&client_id=2Dt738sEQqWL5xN2ILJQig&redirect_uri=http://localhost:3000/&state={userState}"

    # @REQUESTURI2="https://zoom.us/oauth/token/?grant_type=authorization_code&code=" + params[:code] + "&redirect_uri=http://localhost:3000/"

  end

  def index
    p "-------------------"
    p params
    p session[:user_id]
    p "-------------------"

    client_id = ENV['ZOOM_CLIENT_ID']
    
    @REQUESTURI="https://zoom.us/oauth/authorize?response_type=code&client_id=yBw1xlBNTzmBeLsXc1Yy0g&redirect_uri=http://localhost:3000/&state={userState}"

    # @REQUESTURI2="https://zoom.us/oauth/token?grant_type=authorization_code&code=#{params[:code]}&redirect_uri=http://localhost:3000/"



    # client_secret = ENV['ZOOM_CLIENT_SECRET']
    # credential = Base64.strict_encode64(client_id + ':' + client_secret)

    # url = URI.parse("http://zoom.us/")

    # req = Net::HTTP::Post.new(url.path)
    # req.basic_auth client_id, client_secret

    # body_params = {
    #   grant_type: "authorization_code",
    #   code: params[:code],
    #   redirect_uri: "http://localhost:3000/"
    # }
    # request_header = {
    #   'Authorization': "Basic #{credential}",
    #   'Content-Type': 'application/x-www-form-urlencoded'
    # }
    
    # # request = Net::HTTP::Post.new(uri.path,request_header)
    # req.set_form_data(params: body_params.to_json )

    # res = Net::HTTP.new(url.host, url.port).start {|http| http.request(req) }
    # case res
    # when Net::HTTPSuccess, Net::HTTPRedirection
    #   p "OK"
    # else
    #   res.value
    # end
    # # (uri.request_uri, body: body_params.to_json,header: request_header)
    # # response = http.request(request)

    # p "-------------------"
    # p req.body
    # p res.code
    # p res
    # p "-------------------"







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
