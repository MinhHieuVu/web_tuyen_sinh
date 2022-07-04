class Area < ApplicationRecord
  extend FriendlyId
  friendly_id :name, use: :slugged

  has_many :schools
  has_rich_text :description

end