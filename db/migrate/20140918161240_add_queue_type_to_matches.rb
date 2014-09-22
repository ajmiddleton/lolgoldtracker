class AddQueueTypeToMatches < ActiveRecord::Migration
  def change
    add_column :matches, :queue_type, :string
  end
end
