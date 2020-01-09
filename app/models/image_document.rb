# frozen_string_literal: true

class ImageDocument < ApplicationRecord
  include Document
  belongs_to :note
end
