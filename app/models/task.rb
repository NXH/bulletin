class Task < ActiveRecord::Base
  belongs_to :account
  belongs_to :category
  scope :date_ascending, order('due_date asc')
  scope :date_descending, order('due_date desc')
end
