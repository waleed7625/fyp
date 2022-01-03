# frozen_string_literal: true

class Product < ApplicationRecord
  has_many_attached :images
  belongs_to :user, foreign_key: true, optional: true
  has_many :comments, dependent: :destroy
  validate :images_type

  private

  def images_type
    errors.add(:images, 'are missing') if images.attached? == false
    images.each do |image|
      errors.add(:images, 'need to be a JPEG or PNG') unless image.content_type.in?(%('image/jpeg image/png'))
    end
  end
end
