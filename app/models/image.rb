class Image < ActiveRecord::Base
  attr_accessible :image_file, :post_id

  mount_uploader :image_file, ImageFileUploader

  belongs_to :post
end
