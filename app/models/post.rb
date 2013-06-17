class Post < ActiveRecord::Base
  attr_accessible :description, :price, :title, :images

  validates :title,  :presence => true
  validates :price,  :presence => true
  validates :description,  :presence => true
 
  has_many :images
  belongs_to :user

  
end
