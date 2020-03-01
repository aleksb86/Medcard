# frozen_string_literal: true

class User < ApplicationRecord
  has_secure_password

  has_many :cards
  has_many :notes

  EMAIL_PATTERN = /\A([-a-z0-9!\#$%&'*+\/=?^_`{|}~]+\.)*[-a-z0-9!\#$%&'*+\/=?^_`{|}~]+@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i.freeze
  PHONE_PATTERN = /\A\+[1-9]{1}[0-9]{10}\z/.freeze

  validates :email, :password, presence: true, on: :create
  validates :email, uniqueness: true
  validates :password, length: { minimum: 6 }, if: -> { password.present? }
  validates_format_of :email, with: EMAIL_PATTERN
  validates_format_of :phone, with: PHONE_PATTERN, allow_blank: true

  def inactivate
    self.active = false
    save(validate: false)
  end
end
