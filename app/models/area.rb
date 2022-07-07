class Area < ApplicationRecord
  extend FriendlyId
  friendly_id :name, use: :slugged

  # has_many :schools
  has_many :provinces

end