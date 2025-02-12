class Link < ApplicationRecord
  validates :name, presence: true, length: { maximum: 20 }
  validates :url, presence: true, length: { maximum: 1000 }, format: /\A#{URI.regexp(%w[http https])}\z/
  validates :description, presence: true, length: { maximum: 200 }
end
