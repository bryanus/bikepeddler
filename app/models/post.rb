class Post < ActiveRecord::Base
  attr_accessible :description, :price, :title, :images, :category_id, :adtype

  validates :title, :presence => true, :on => :create
  validates :price, :presence => true, :on => :create
  validates :description, :presence => true, :on => :create

  validates :price, format: { with: /^\d+(.\d{1,2})?$/i }


 
  has_many :images
  belongs_to :user
  belongs_to :category

  def self.listing_types
  	adtypes = [['For Sale',0], ['Wanted',1], ['Trade',2]]
  end

  def listing_type(id)
  	if id == 0
  		"For Sale"
  	elsif id == 1
  		"Wanted"
  	else 
  		"Trade"
  	end
  end
  
end
