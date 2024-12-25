module ApplicationHelper
  def select_values(column, enum_attributes)
    enum_attributes.map { |key, value| [ I18n.t("menu.enum.#{column}.#{key}"), key ] }
  end
end
