class AddZipToPosts < ActiveRecord::Migration
  def change
  	add_column :posts, :zip, :integer
  end
end
