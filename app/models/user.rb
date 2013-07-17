class User < ActiveRecord::Base
  has_secure_password

  attr_accessible :email, :fname, :lname, :password, :password_confirmation

  validates_uniqueness_of :email
  validates_presence_of :email
  validates_presence_of :password, :on => :create
  validates_length_of :password, :minimum => 4, :allow_blank => true
  validates_confirmation_of :password

  validates :email, format: {with: /[\w\-\.]+@[\w\-\.]+\.[\w]{2,7}/i }
  
  has_many :posts
  has_many :comments



end
