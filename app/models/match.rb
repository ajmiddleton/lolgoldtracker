class Match < ActiveRecord::Base
  belongs_to :summoner
  has_one :MatchTimeline
end
