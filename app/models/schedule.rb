class Schedule < ApplicationRecord
  MAX_NUMBER_OF_PASSENGER = 20

  belongs_to :menu
  validates :menu_id, presence: true
  validates :num_reservation, numericality: { in: 0..MAX_NUMBER_OF_PASSENGER  }
  validates :start_time, presence: true
  validate :comparison_with_menus_acceptable_num

  scope :on, ->(date) do
    where(start_time: date.to_datetime..).where(start_time: ...(date.to_datetime + 1.day))
  end

  private
  def comparison_with_menus_acceptable_num
    if num_reservation > menu.acceptable_num
      errors.add(:num_reservation, ": 予約済人数はメニューの乗船可能人数以下である必要があります。")
    end
  end
end
