require 'net/http'
require 'json'
require 'cgi'

class RiotApi
  attr_reader :api_key
  attr_accessor :region

  def initialize api_key, region
    @api_key = api_key
    @region = region
  end

  def api_url path, params = {}
    query_string = URI.encode_www_form params.merge api_key: api_key
    query_string = "https://#{region}.api.pvp.net/api/lol/#{region}/#{self.class.api_version}/#{path}?#{query_string}"
  end

  def perform_request url
    uri = URI(url)
    res = Net::HTTP.get_response(uri)
    res.code == "404" ? "Bad Request" : JSON.parse(res.body)
  end
end
