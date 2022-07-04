class SchoolInfo < ApplicationRecord
  extend FriendlyId
  friendly_id :name, use: :slugged

  belongs_to :school, optional: true, touch: true
  has_rich_text  :scope
  has_rich_text :method
  has_rich_text :threshold
  has_rich_text :info
  has_rich_text :incorporation
  has_rich_text :policy
  has_rich_text :fees
  has_rich_text :tuition

end