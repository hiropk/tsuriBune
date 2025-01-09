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

  enum :pref, {
    hokkaidou: 1, aomori: 2, iwate: 3, miyagi: 4, akita: 5, yamagata: 6, fukushima: 7,
    ibaraki: 8, totigi: 9, gunma: 10, saitama: 11, tiba: 12, tokyo: 13, kanagawa: 14,
    niigata: 15, toyama: 16, ishikawa: 17, fukui: 18, yamanashi: 19, nagano: 20,
    gifu: 21, shizuoka: 22, aiti: 23, mie: 24,
    shiga: 25, kyoto: 26, osaka: 27, hyogo: 28, nara: 29, wakayama: 30,
    tottori: 31, shimane: 32, okayama: 33, hiroshima: 34, yamaguti: 35,
    tokushima: 36, kagawa: 37, ehime: 38, kouti: 39,
    fukuoka: 40, saga: 41, nagasaki: 42, kumamoto: 43, oita: 44, miyazaki: 45, kagoshima: 46,
    okinawa: 47
  }


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
