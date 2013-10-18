class User < ActiveRecord::Base
  include Gravtastic
  gravtastic
  
  attr_accessible :username, :email, :fname, :lname, :zip, :password, :password_confirmation

  has_secure_password

  validates_uniqueness_of :username, :on => :create
  validates_uniqueness_of :email, :on => :create
  validates_uniqueness_of :email, :on => :update
  validates_presence_of :email
  validates_presence_of :password, :on => :create
  validates_length_of :password, :minimum => 4, :allow_blank => true
  validates_confirmation_of :password

  validates :email, format: {with: /[\w\-\.]+@[\w\-\.]+\.[\w]{2,7}/i }
  
  before_create { generate_token(:auth_token) }
  
  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy

  def send_password_reset
    generate_token(:password_reset_token)
    self.password_reset_sent_at = Time.zone.now
    save!
    UserMailer.password_reset(self).deliver
  end

  def generate_token(column)
    begin
      self[column] = SecureRandom.urlsafe_base64
    end while User.exists?(column => self[column])
  end


end
