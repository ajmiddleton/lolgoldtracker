class RemoveMatchIdFromMatchTimelines < ActiveRecord::Migration
  def change
    remove_column :match_timelines, :match_id
  end
end
