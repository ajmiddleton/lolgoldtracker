require './lib/riot/client'

class Summoner < ActiveRecord::Base
  has_many :matches
  validates_presence_of :name

  def find_or_create_by_name name
    api_summoner = api_lookup name
    return api_summoner if api_summoner == "Bad Request"
    summoner = Summoner.find_by_name(api_summoner["name"])
    if summoner
      summoner
    else
      summoner = Summoner.create(name: api_summoner["name"], participant_id: api_summoner["id"])
    end
  end

  def avg_gold_earned
    matches.average(:gold_earned).round(2)
  end

  def avg_gold_spent
    matches.average(:gold_spent).round(2)
  end

  def avg_match_duration
    matches.average(:match_duration).round(2)
  end

  def readable_avg_match_duration
    "#{(avg_match_duration / 60).round} minutes #{(avg_match_duration % 60).round} seconds"
  end

  def avg_gold_per_min
    (avg_gold_earned / (avg_match_duration / 60)).round(2)
  end

  protected

  def client
    Client.new(ENV["RIOT_API_KEY"], "na")
  end

  def api_lookup name
    client.summoner.by_name name
  end
end
