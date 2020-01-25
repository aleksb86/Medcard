# frozen_string_literal: true

class Note < ApplicationRecord
  enum kind: %i[consultation examination]
  belongs_to :card
  belongs_to :category
  belongs_to :user
  belongs_to :parent, class_name: 'Note'
  has_many :pdf_docs
  has_many :images
  has_many :children, class_name: 'Note', foreign_key: 'parent_id'
  has_one :consultation
  has_one :examination
end
