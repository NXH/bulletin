class Category < ActiveRecord::Base
  belongs_to :account
  has_many :events
  has_many :tasks

  validates :account_id, :presence => true
  validates :name, :presence => true
end
