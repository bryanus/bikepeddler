class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.string :image_file
      t.integer :post_id

      t.timestamps

    end
    add_index :images, :post_id
  end
end
