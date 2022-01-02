# frozen_string_literal: true

class Product < ApplicationRecord
  has_many_attached :images
  belongs_to :user, foreign_key: true, optional: true
  validate :images_type

  private
  def images_type
if images.attached? == false
  errors.add(:images,"are missing")
end
images.each do |image|
if !image.content_type.in?(%('image/jpeg image/png'))
  errors.add(:images, 'need to be a JPEG or PNG')
end
end
  end
end

