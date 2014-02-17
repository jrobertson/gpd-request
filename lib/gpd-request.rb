#!/usr/bin/env ruby

# file: gpd-request.rb

require 'net/http'


class GPDRequest

  def initialize(user=nil, pass=nil, headers={})
    @headers = {
      "User-Agent" => "Ruby-GPDRequest"
    }.merge headers
    @username, @password = user, pass
  end

  def request(uri)  
    path = uri
    url = URI.parse(path)
    req = yield(url)
    req.basic_auth(@username, @password) if @user
    response = Net::HTTP.new(url.host, url.port).start do |http| 
      http.request(req) 
    end
    response
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

  def delete(arg, form_data={})
    methods = {String: :string_delete, Array: :array_delete}
    send (methods[arg.class.to_s.to_sym]), arg, form_data
  end  

  def string_delete(uri, form_data={})
    request(uri) do |url| 
      req = Net::HTTP::Delete.new(url.path, @headers)
      req.set_form_data form_data unless form_data.empty?
      req
    end
  end  

  def array_delete(a, form_data={})
    a.map do  |uri|
      request(uri) do |url| 
        req = Net::HTTP::Delete.new(url.path, @headers)
        req.set_form_data form_data unless form_data.empty?
        req
      end
    end
  end

end