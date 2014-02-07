class Image < ActiveRecord::Base
 

  mount_uploader :image_file, ImageFileUploader

  belongs_to :post
end
