# frozen_string_literal: true

class Examination < ApplicationRecord
  belongs_to :examination_type
  belongs_to :note
end
