require 'uri'
require 'net/http'

url = URI("https://api.zoom.us/v2/users?status=active&page_size=30&page_number=1")

http = Net::HTTP.new(url.host, url.port)
http.use_ssl = true
http.verify_mode = OpenSSL::SSL::VERIFY_NONE

request = Net::HTTP::Get.new(url)
request["authorization"] = 'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOm51bGwsImlzcyI6IkZBeGpnaEFUVGd1TDhDcGNoOE1oV3ciLCJleHAiOjE2NDIzMTUwODcsImlhdCI6MTY0MjMwOTY4OH0.WKBJMEMK_9xUa7eZwCCthYzForl33x5UUND0ugrY9cY'
request["content-type"] = 'application/json'

response = http.request(request)
puts response.read_body