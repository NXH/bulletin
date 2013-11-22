class Event < ActiveRecord::Base
  belongs_to :account
  belongs_to :category
  scope :date_ascending, order('start_date asc')
  scope :date_descending, order('start_date desc')

  validates :title, :presence => true
  validates :category_id, :presence => true
  validates :start_time, :presence => true
  validates :end_time, :presence => true

  def time_format(time)
    return time.to_formatted_s(:short)
  end
end
