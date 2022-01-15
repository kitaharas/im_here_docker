require 'net/http'
require 'jwt'
require 'json'
require 'active_support/time'
require 'dotenv'

class ZoomTest
  # USER_ID =    ENV['ZOOM_US_USER_EMAIL']
  # API_KEY =    ENV['ZOOM_US_API_KEY']
  # API_SECRET = ENV['ZOOM_US_API_SECRET']
  USER_ID =    'mizupe1223@gmail.com'
  API_KEY =    'FAxjghATTguL8Cpch8MhWw'
  API_SECRET = 'magMH0SSAvPGZK6cTjRLDj460vnyaXAKNj89'
  PAYLOAD = {
    iss: API_KEY,
    exp: 1.hour.from_now.to_i
  }
  def initialize
    #Automatically creates header and return JWT
    token = JWT.encode(PAYLOAD, API_SECRET, 'HS256', {typ: 'JWT'})
    #token = ENV['ZOOM_TOKEN']
    url = URI("https://api.zoom.us/v2/users/#{USER_ID}/meetings")
    # Create the HTTP objects
    http = Net::HTTP.new(url.host, url.port)
    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE
    request = Net::HTTP::Post.new(url)
    request["authorization"] = "Bearer #{token}"
    request["content-type"] = 'application/json'
    meeting_params = {
      "topic" => "イベントタイトル", # params[:topic]
      "type" => 2, # MTGタイプ 2はスケジュールされたMTG
      "start_time" => "2022-01-13T20:20:00",  # yyyy-MM-ddThh:mm:ssで表記
      "duration" => 60, # params[:duration] MTG時間
      "schejule_for" => "北原", # address IDなどと記載、ホストのユーザーIDのこと？
      "timezone" => "Asia/Tokyo", # 東京時間
      "password" => "123456", # params[:password]
      "settings": {
        "use_pmi": "false"
      }
    }
    request.body =  meeting_params.to_json
    # Send the request
    res = http.request(request)
    res = JSON.parse(res.body)
    p "=====result====="
    p USER_ID
    p res
    p "=====result====="
  end
end

ZoomTest.new