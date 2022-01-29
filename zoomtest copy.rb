require 'net/http'
require 'jwt'
require 'json'
require 'active_support/time'
require 'dotenv'
require "base64"

class ZoomTest
  # USER_ID =    ENV['ZOOM_US_USER_EMAIL']
  # API_KEY =    ENV['ZOOM_US_API_KEY']
  # API_SECRET = ENV['ZOOM_US_API_SECRET']
  
  # client_id = ENV['ZOOM_CLIENT_ID']
  # client_secret = ENV['ZOOM_CLIENT_SECRET'] 
  
  
  # USER_ID = 'mizupe1223@gmail.com'


  


  CLIENT_ID = 
  CLIENT_SECRET = 
  REDIRECT_URI = "http://localhost:3000/"

  # PAYLOAD = {
  #   iss: CLIENT_ID,
  #   exp: 1.hour.from_now.to_i
  # }

  def initialize
    uri = URI.parse("https://zoom.us/oauth/token")
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = uri.scheme === "https"

    query = {
      grant_type: "authorization_code",
      code: params["code"],
      redirect_uri: REDIRECT_URI,
    }

    credential = Base64.strict_encode64("#{CLIENT_ID}:#{CLIENT_SECRET}")
    headers = { "authorization" => "Basic #{credential}" }
    response = http.post(uri.path, query.to_param, headers)

    if response.code == "200"
      body = JSON.parse(response.body)
      # access_token, refresh_tokenを永続化する
      # body
      # => {"access_token"=> "xxx",
      #     "token_type"=>"bearer",
      #     "refresh_token"=> "xxx",
      #     "expires_in"=>3599,
      #     "scope"=>"meeting:read meeting:write user:read user_profile"}
      Rails.logger.debug("#{body.inspect}")

      # 試しに自分の情報を取得する
      profile = users_me(body["access_token"])
      render plain: profile
      return
    end

    render plain: "NG"
  end

  private

  def users_me(token)
    uri = URI.parse("https://api.zoom.us/v2/users/me")
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = uri.scheme === "https"

    headers = { "authorization" => "Bearer #{token}" }
    response = http.get(uri.path, headers)

    body = JSON.parse(response.body)
    "#{body["last_name"]} #{body["first_name"]}, #{body["email"]}"
  end
end



#     #Automatically creates header and return JWT
#     token = JWT.encode(PAYLOAD, CLIENT_SECRET, 'HS256', {typ: 'JWT'})
#     #token = ENV['ZOOM_TOKEN']
#     url = URI("https://api.zoom.us/v2/users/#{USER_ID}/meetings")
#     # Create the HTTP objects
#     http = Net::HTTP.new(url.host, url.port)
#     http.use_ssl = true
#     http.verify_mode = OpenSSL::SSL::VERIFY_NONE
#     request = Net::HTTP::Post.new(url)
#     request["authorization"] = "Bearer #{token}"
#     request["content-type"] = 'application/json'
#     meeting_params = {
#       "topic" => "イベントタイトル", # params[:topic]
#       "type" => 2, # MTGタイプ 2はスケジュールされたMTG
#       "start_time" => "2022-01-13T20:20:00",  # yyyy-MM-ddThh:mm:ssで表記
#       "duration" => 60, # params[:duration] MTG時間
#       "schejule_for" => "北原", # address IDなどと記載、ホストのユーザーIDのこと？
#       "timezone" => "Asia/Tokyo", # 東京時間
#       "password" => "123456", # params[:password]
#       "settings": {
#         "use_pmi": "false"
#       }
#     }
#     request.body =  meeting_params.to_json
#     # Send the request
#     res = http.request(request)
#     res = JSON.parse(res.body)
#     p "=====result====="
#     p USER_ID
#     p res
#     p "=====result====="
#   end
# end

ZoomTest.new