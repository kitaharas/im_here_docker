require 'net/https'
require 'uri'
require 'json'


class TS_Zoom
  def initialize
    @api_key = "xxx" 
    @secret  = 'yyy'
    @user_id = "zzz"
    @JWT = "aaa"
    @meeting_url = "bbb"
  end
  def GenerateJWT
    payload = { 
      iss: @api_key,
      exp: Time.now.to_i + 4 * 36000
    }
    token = JWT.encode payload, @secret, 'HS256'
    return token
  end

  def GetUserData(_token)
    uri = URI.parse("https://api.zoom.us/v2/users")
    request = Net::HTTP::Get.new(uri)
    request["Authorization"] = "Bearer "+_token
    req_options = {
      use_ssl: uri.scheme == "https",
    }
    response = Net::HTTP.start(uri.hostname, uri.port, req_options) do |http|
      http.request(request)
    end
    result = JSON.parse(response.body)
    return result["users"][0]["id"].to_s
  end

  def GetMeetingURL
    @JWT = self.GenerateJWT
    @user_id = self.GetUserData(@JWT)
    @meeting_url = "https://api.zoom.us/v2/users/" + @user_id + "/meetings"
    puts @JWT
    puts @user_id
    puts @meeting_url

      uri = URI.parse(@meeting_url)
      http = Net::HTTP.new(uri.host, uri.port)

      http.use_ssl = true
      http.verify_mode = OpenSSL::SSL::VERIFY_NONE

      req = Net::HTTP::Post.new(uri.path, 'Content-Type' => 'application/json')
      req.body = {
        "type":1,
        "Authorization": "Bearer "+@JWT
        }.to_json
      res = http.request(req)
      puts res.class
      puts res.code
      puts res.body
      return res
  end
end

TS_Zoom.new