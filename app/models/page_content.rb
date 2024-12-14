class PageContent < ApplicationRecord
  serialize :contents, coder: YAML, type: Array, default: []

  validates :display_page, presence: true
  validates :head, presence: true, length: { maximum: 20 }
  validates :contents, presence: true, length: { maximum: 150 }
end
