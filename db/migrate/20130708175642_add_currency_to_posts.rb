class AddCurrencyToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :currency, :integer, :default => 0
  end
end
