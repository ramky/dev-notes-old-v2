class Topic < ActiveRecord::Base
  has_many :notes
  belongs_to :account

  validates_presence_of :name

  default_scope -> { order('name asc') }
  scope :all_for_account, (->(id) { where('account_id = ?', id) })
end
