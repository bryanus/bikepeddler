class Post < ActiveRecord::Base
  attr_accessible :description, :price, :title, :images, :category_id, :adtype

  validates :title,  :presence => true
  validates :price,  :presence => true 
  #need to add formatting validations for price
  validates :description,  :presence => true
 
  has_many :images
  belongs_to :user
  belongs_to :category
  
end
