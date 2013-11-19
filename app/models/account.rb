class Account < ActiveRecord::Base
  has_many :categories
  has_many :events
  has_many :tasks
end
