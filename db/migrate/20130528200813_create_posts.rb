class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.string :price
      t.text :description
      t.integer :user_id
      t.integer :category_id
      t.integer :adtype
      t.integer :status, :default => 0

      t.timestamps
    end
  end
end
