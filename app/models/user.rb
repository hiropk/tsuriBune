class User < ApplicationRecord
  has_secure_password
  has_many :sessions, dependent: :destroy
  has_many :microposts, dependent: :destroy

  normalizes :email_address, with: ->(e) { e.strip.downcase }
  # admin@example.com
  # password
end
