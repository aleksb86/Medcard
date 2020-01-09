# frozen_string_literal: true

class Card < ApplicationRecord
  enum disability_group: %i[first_group second_group third_group]
  enum blood_type: %i[
    first_positive first_negative second_positive second_negative
    third_positive third_negative fourth_positive fourth_negative
  ]
  has_many :notes
end
