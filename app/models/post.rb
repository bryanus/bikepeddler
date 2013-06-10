class Post < ActiveRecord::Base
  attr_accessible :description, :price, :title, :images

  validates :title,  :presence => true, :on => :save
  validates :price,  :presence => true, :on => :save
  validates :description,  :presence => true, :on => :save
 
  has_many :images

  
end
