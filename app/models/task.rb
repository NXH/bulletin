class Task < ActiveRecord::Base
  belongs_to :account
  belongs_to :category

  scope :date_ascending, order('due_date asc')
  scope :date_descending, order('due_date desc')

  validates :title, :presence => true
  validates :account_id, :presence => true
  validates :category_id, :presence => true
end
