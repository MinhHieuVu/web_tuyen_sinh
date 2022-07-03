class SchoolInfo < ApplicationRecord
  extend FriendlyId
  friendly_id :name, use: :slugged

  belongs_to :school, optional: true, touch: true
end