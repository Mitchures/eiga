class AddWatchlistToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :watchlist, :integer,array: true, default: []
  end
end
