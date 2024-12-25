class FishingServiceInfo < ApplicationRecord
  serialize :administrator, coder: YAML, type: Array, default: []

  validates :name, presence: true, length: { maximum: 20 }
  validates :pref, presence: true
  validates :number, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :registration_start_date, presence: true
  validates :registration_end_date, presence: true
  validates :address, presence: true, length: { maximum: 150 }
  validates :ship_name, presence: true, length: { maximum: 20 }
  validates :administrator, presence: true
  validates :insurance_start_date, presence: true
  validates :insurance_end_date, presence: true

  validate :registration_date_validation
  validate :insurance_date_validation

  def registration_date_validation
    if registration_start_date >= registration_end_date
      errors.add(:registration_start_date, ": 登録の開始日は終了日以前に設定してください。")
    end
  end

  def insurance_date_validation
    if insurance_start_date >= insurance_end_date
      errors.add(:insurance_start, ": 賠償期間の開始日は終了日以前に設定してください。")
    end
  end
end
