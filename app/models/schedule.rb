class Schedule < ApplicationRecord
  belongs_to :menu

  scope :on, ->(date) do
    where(start_time: date.to_datetime..).where(start_time: ...(date.to_datetime + 1.day))
  end
end
