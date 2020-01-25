# frozen_string_literal: true

class User < ApplicationRecord
  has_secure_password

  has_many :cards
  has_many :notes

  validates :email, :password, presence: true
  validates :email, uniqueness: true
  validates :password, length: { minimum: 8 }

  # TODO: add validations for phone
end
