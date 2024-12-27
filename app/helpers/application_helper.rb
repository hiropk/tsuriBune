module ApplicationHelper
  def select_values(model, column, enum_attributes)
    enum_attributes.map { |key, value| [ I18n.t("#{model}.enum.#{column}.#{key}"), key ] }
  end
end
