class AddMatchModeToMatches < ActiveRecord::Migration
  def change
    add_column :matches, :match_mode, :string
  end
end
