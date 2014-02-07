class Comment < ActiveRecord::Base
  

  validates :comment, :presence => true, :on => :create

  belongs_to :post
  belongs_to :user
end
