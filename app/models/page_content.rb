class PageContent < ApplicationRecord
  serialize :contents, coder: YAML, type: Array, default: []

  validates :display_page, presence: true
  validates :head, presence: true, length: { maximum: 20 }
  validates :contents, length: { maximum: 5 }

  validate :contents_text_length

  def contents_text_length
    return if contents.empty?

    invalid_indexs = []
    contents.each_with_index do |content, i|
      invalid_indexs << i+1 if content.length > 10
    end

    if invalid_indexs.length > 0
      errors.add(:contents, ": 10字を超える項目(#{invalid_indexs.join(', ')}項目目)は設定できません。")
    end
  end

  enum :display_page, { home: 0, menu: 1, ship: 2, safety: 3, schedule: 4, link: 5 }
end
