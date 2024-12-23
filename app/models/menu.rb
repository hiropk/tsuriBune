class Menu < ApplicationRecord
  validates :name, presence: true, length: { maximum: 10 }
  validates :embarkation_type, presence: true
  validates :unit_price, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :acceptable_num, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :payment_method, presence: true

  enum :embarkation_type, { ride_share: 0, charter: 1 }
  enum :payment_method, { cash_only: 0, cashless: 1 }
end
