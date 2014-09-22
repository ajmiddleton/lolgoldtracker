class AddKillsAndDeathsToMatches < ActiveRecord::Migration
  def change
    add_column :matches, :kills, :integer
    add_column :matches, :deaths, :integer
  end
end
