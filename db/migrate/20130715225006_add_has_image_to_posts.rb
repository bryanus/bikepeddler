class AddHasImageToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :has_image, :boolean, :default => false
  end
end
