class AddQtyToPosts < ActiveRecord::Migration
  def change
  	add_column :posts, :qty, :integer
  end
end
