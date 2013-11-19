class Task < ActiveRecord::Base
  belongs_to :account
  has_many :tasks
  has_many :events
end
