class Account < ActiveRecord::Base
  has_many :topics

  validates_presence_of :name

  has_secure_password
end
