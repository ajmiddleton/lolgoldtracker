class CreateMatchTimelines < ActiveRecord::Migration
  def change
    create_table :match_timelines do |t|
      t.float :first_creeps_per_min_deltas
      t.float :second_creeps_per_min_deltas
      t.float :third_creeps_per_min_deltas
      t.float :end_creeps_per_min_deltas
      t.float :first_cs_diff_per_min_deltas
      t.float :second_cs_diff_per_min_deltas
      t.float :third_cs_diff_per_min_deltas
      t.float :end_cs_diff_per_min_deltas
      t.float :first_gold_per_min_deltas
      t.float :second_gold_per_min_deltas
      t.float :third_gold_per_min_deltas
      t.float :end_gold_per_min_deltas

      t.timestamps
    end
  end
end
