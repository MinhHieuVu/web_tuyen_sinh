class School < ApplicationRecord
  extend FriendlyId
  friendly_id :name, use: :slugged

  belongs_to :area, optional: true
  belongs_to :province, optional: true
  has_many :school_infos

  # SCHOOL_INFO = {
  #   "cong-lap": "Công lập",
  #   "tu-thuc": "Tự thục",
  #   "dan-lap": "Dân lập"
  # }
  has_rich_text :objective
  has_rich_text :scope
  has_rich_text :method
  has_rich_text :criteria
  has_rich_text :threshold
  has_rich_text :info
  has_rich_text :incorporation
  has_rich_text :policy
  has_rich_text :fees
  has_rich_text :tuition

end