require './lib/riot/client'

class Summoner < ActiveRecord::Base
  has_many :matches
  validates_presence_of :name

  def api_lookup name
    Client.new(ENV["RIOT_API_KEY"], "na").summoner.by_name name
  end
end
