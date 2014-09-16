class AddSummonerIdToMatches < ActiveRecord::Migration
  def change
    add_column :matches, :summoner_id, :integer
  end
end
