class CreateMatches < ActiveRecord::Migration
  def change
    create_table :matches do |t|
      t.integer :gold_earned
      t.integer :gold_spent
      t.datetime :match_creation
      t.integer :riot_match_id
      t.boolean :winner
      t.integer :match_duration

      t.timestamps
    end
  end
end
