require './lib/riot/client'

class Match < ActiveRecord::Base
  VALID_MATCH_TYPES = ["NORMAL_5x5_BLIND", "RANKED_SOLO_5x5", "RANKED_PREMADE_5x5", "NORMAL_5x5_DRAFT", "RANKED_TEAM_5x5", "GROUP_FINDER_5x5"]
  belongs_to :summoner
  has_one :match_timeline
  validates_presence_of :gold_earned, :gold_spent, :match_creation, :riot_match_id, :match_duration, :queue_type, :match_mode, :kills, :deaths
  validates_inclusion_of :winner, in: [true, false]

  def import_match_history summoner
    matches = client.match_history.by_summoner_id summoner.participant_id
    import matches, summoner
  end

  protected

  def client
    Client.new(ENV["RIOT_API_KEY"], "na")
  end

  def import matches, summoner
    matches.each do |match|
      match_hash = {
        match_mode: match["matchMode"],
        queue_type: match["queueType"],
        gold_earned: match["participants"][0]["stats"]["goldEarned"],
        gold_spent: match["participants"][0]["stats"]["goldSpent"],
        match_creation: Time.at(match["matchCreation"]).to_datetime,
        riot_match_id: match["matchId"],
        winner: match["participants"][0]["stats"]["winner"],
        match_duration: match["matchDuration"],
        kills: match["participants"][0]["stats"]["kills"],
        deaths: match["participants"][0]["stats"]["deaths"]
      }
      unless Match.where(riot_match_id: match_hash[:riot_match_id], summoner_id: summoner.id).any? || !VALID_MATCH_TYPES.include?(match["queueType"])
        m = summoner.matches.create(match_hash)
        timeline_hash = {
          first_creeps_per_min_deltas: match["participants"][0]["timeline"]["creepsPerMinDeltas"]["zeroToTen"],
          second_creeps_per_min_deltas: match["participants"][0]["timeline"]["creepsPerMinDeltas"]["tenToTwenty"],
          third_creeps_per_min_deltas: match["participants"][0]["timeline"]["creepsPerMinDeltas"]["twentyToThirty"],
          end_creeps_per_min_deltas: match["participants"][0]["timeline"]["creepsPerMinDeltas"]["thirtyToEnd"],
          first_gold_per_min_deltas: match["participants"][0]["timeline"]["goldPerMinDeltas"]["zeroToTen"],
          second_gold_per_min_deltas: match["participants"][0]["timeline"]["goldPerMinDeltas"]["tenToTwenty"],
          third_gold_per_min_deltas: match["participants"][0]["timeline"]["goldPerMinDeltas"]["twentyToThirty"],
          end_gold_per_min_deltas: match["participants"][0]["timeline"]["goldPerMinDeltas"]["thirtyToEnd"]
        }
        timeline_hash = timeline_hash.merge({
          first_cs_diff_per_min_deltas: match["participants"][0]["timeline"]["csDiffPerMinDeltas"]["zeroToTen"],
          second_cs_diff_per_min_deltas: match["participants"][0]["timeline"]["csDiffPerMinDeltas"]["tenToTwenty"],
          third_cs_diff_per_min_deltas: match["participants"][0]["timeline"]["csDiffPerMinDeltas"]["twentyToThirty"],
          end_cs_diff_per_min_deltas: match["participants"][0]["timeline"]["csDiffPerMinDeltas"]["thirtyToEnd"]
        }) if match["participants"][0]["timeline"].has_key?("csDiffPerMinDeltas")
        m.create_match_timeline(timeline_hash)
      end
    end
  end
end
