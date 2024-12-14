class PageContent < ApplicationRecord
  serialize :contents, coder: YAML, type: Array, default: []

  validates :display_page, presence: true
  validates :head, presence: true, length: { maximum: 20 }
  validates :contents, length: { maximum: 150 }

  enum :display_page, { home: 0, menu: 1, ship: 2, safety: 3, schedule: 4, link: 5 }
end
