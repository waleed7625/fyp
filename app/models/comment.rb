# frozen_string_literal: true

class Comment < ApplicationRecord
  belongs_to :product, foreign_key: true, optional: true
  belongs_to :user, foreign_key: true, optional: true
end
