class MatchTimeline < ActiveRecord::Base
  belongs_to :match

  def creeps_per_min_array
    [first_creeps_per_min_deltas, second_creeps_per_min_deltas, third_creeps_per_min_deltas, end_creeps_per_min_deltas]
  end

  def gold_per_min_array
    [first_gold_per_min_deltas, second_gold_per_min_deltas, third_gold_per_min_deltas, end_gold_per_min_deltas]
  end
end
