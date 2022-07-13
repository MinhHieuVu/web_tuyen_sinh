class SchoolInfo < ApplicationRecord

  belongs_to :school, optional: true, touch: true

end