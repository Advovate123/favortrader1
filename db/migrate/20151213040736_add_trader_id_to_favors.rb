class AddTraderIdToFavors < ActiveRecord::Migration
  def change
    add_column :favors, :trader_id, :integer
  end
end
