class School < ApplicationRecord
  belongs_to :area, optional: true, touch: true
  belongs_to :province, optional: true, touch: true
  has_many :school_infos
end