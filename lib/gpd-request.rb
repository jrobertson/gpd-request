require 'net/http'
require 'rexml/document'
include REXML

# file: gpd-request.rb

class GPDRequest

  def initialize(user, pass, headers={})
    @headers = {
      "User-Agent" => "Ruby-GPDRequest"
    }.merge headers
    @username, @password = user, pass
  end

  def request(uri)  
    path = uri
    url = URI.parse(path)
    req = yield(url)
    req.basic_auth(@username, @password)
    response = Net::HTTP.new(url.host, url.port).start { |http| http.request(req) }
    Document.new(response.body).write
  end
  
  def get(uri)
    request(uri) {|url| Net::HTTP::Get.new url.path, @headers }
  end

  def post(uri, form_data={})
    request(uri) do |url| 
      req = Net::HTTP::Post.new(url.path, @headers)
      req.set_form_data form_data unless form_data.empty?
      req
    end
  end  

  def delete(uri, form_data={})
    request(uri) do |url| 
      req = Net::HTTP::Delete.new(url.path, @headers)
      req.set_form_data form_data unless form_data.empty?
      req
    end
  end  
end
