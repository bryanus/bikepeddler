class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.decimal :price, :precision => 8, :scale => 2
      t.text :description
      t.integer :user_id
      t.integer :category_id
      t.integer :adtype
      t.integer :status, :default => 0

      t.timestamps
    end
    add_index :posts, :title
  end
end
