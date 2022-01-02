# frozen_string_literal: true

class Product < ApplicationRecord
  has_many_attached :photos
  belongs_to :user, foreign_key: true, optional: true
end
