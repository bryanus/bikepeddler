class User < ActiveRecord::Base
  attr_accessible :email, :fname, :password_digest
end
