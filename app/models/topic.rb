class Topic < ActiveRecord::Base
  has_many :notes
  belongs_to :account

  validates_presence_of :name
end
