require './lib/riot/riot_api'
require './lib/riot/summoner_request'
require './lib/riot/match_history_request'

class Client
  attr_accessor :region
  attr_reader :api_key

  def initialize(api_key, region)
    @api_key = api_key
    @region = region
  end

  def summoner
    @summoner_request ||= SummonerRequest.new(@api_key, @region)
  end

  def match_history
    @match_history_request ||= MatchHistoryRequest.new(@api_key, @region)
  end
end
