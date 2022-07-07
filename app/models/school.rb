class School < ApplicationRecord
  extend FriendlyId
  friendly_id :name, use: :slugged

  belongs_to :area, optional: true
  belongs_to :province, optional: true
  has_many :school_infos

  SCHOOL_INFO = {
    "cong-lap": "Công lập",
    "tu-thuc": "Tự thục",
    "dan-lap": "Dân lập"
  }

end