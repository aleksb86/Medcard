# frozen_string_literal: true

json.array! @categories do |category|
  json.name t "models.categories.#{category.name}"
end
