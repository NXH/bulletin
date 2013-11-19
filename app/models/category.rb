class Category < ActiveRecord::Base
  belongs_to :account
  has_many :events
  has_many :tasks
end
