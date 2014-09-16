class AddMatchIdToMatchTimelines < ActiveRecord::Migration
  def change
    add_column :match_timelines, :match_id, :integer
  end
end
