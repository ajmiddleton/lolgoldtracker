require './lib/riot/client'

class Match < ActiveRecord::Base
  belongs_to :summoner
  has_one :match_timeline
  validates_presence_of :gold_earned, :gold_spent, :match_creation, :match_id, :winner, :match_duration

  def import_match_history summoner_id
    matches = client.match_history.by_summoner_id summoner_id
    import matches
  end

  protected

  def client
    Client.new(ENV["RIOT_API_KEY"], "na")
  end

  def import matches
    matches_array = []
    matches.each do |match|
      matches_array << Match.create({
        gold_earned: match["participants"][0]["stats"]["goldEarned"],
        gold_spent: match["participants"][0]["stats"]["goldSpent"],
        match_creation: match["matchCreation"],
        match_id: match["matchId"],
        winner: match["participants"][0]["stats"]["winner"],
        match_duration: match["matchDuration"]
      })
      matches_array.last.create_match_timeline({
        first_creeps_per_min_deltas: match["participants"][0]["timeline"]["creepsPerMinDeltas"]["zeroToTen"],
        second_creeps_per_min_deltas: match["participants"][0]["timeline"]["creepsPerMinDeltas"]["tenToTwenty"],
        third_creeps_per_min_deltas: match["participants"][0]["timeline"]["creepsPerMinDeltas"]["twentyToThirty"],
        end_creeps_per_min_deltas: match["participants"][0]["timeline"]["creepsPerMinDeltas"]["thirtyToEnd"],
        first_cs_diff_per_min_deltas: match["participants"][0]["timeline"]["csDiffPerMinDeltas"]["zeroToTen"],
        second_cs_diff_per_min_deltas: match["participants"][0]["timeline"]["csDiffPerMinDeltas"]["tenToTwenty"],
        third_cs_diff_per_min_deltas: match["participants"][0]["timeline"]["csDiffPerMinDeltas"]["twentyToThirty"],
        end_cs_diff_per_min_deltas: match["participants"][0]["timeline"]["csDiffPerMinDeltas"]["thirtyToEnd"],
        first_gold_per_min_deltas: match["participants"][0]["timeline"]["goldPerMinDeltas"]["zeroToTen"],
        second_gold_per_min_deltas: match["participants"][0]["timeline"]["goldPerMinDeltas"]["tenToTwenty"],
        third_gold_per_min_deltas: match["participants"][0]["timeline"]["goldPerMinDeltas"]["twentyToThirty"],
        end_gold_per_min_deltas: match["participants"][0]["timeline"]["goldPerMinDeltas"]["thirtyToEnd"]
      })
    end
    matches_array
  end
end
