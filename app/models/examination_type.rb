# frozen_string_literal: true

class ExaminationType < ApplicationRecord
  has_many :examinations
end
