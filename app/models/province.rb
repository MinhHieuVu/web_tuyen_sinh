class Province < ApplicationRecord

  extend FriendlyId
  friendly_id :name, use: :slugged

  has_many :schools
  belongs_to :area, optional: true

end