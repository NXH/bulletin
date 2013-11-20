class Event < ActiveRecord::Base
  belongs_to :account
  belongs_to :category
  scope :date_ascending, order('start_date asc')
  scope :date_descending, order('start_date desc')

  def time_format(time)
    return time.to_formatted_s(:short)
  end
end
