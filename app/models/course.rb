class Course < ActiveRecord::Base
  # has_many :cohorts
  has_and_belongs_to_many :locations
  # has_many: students, through: :cohorts
end
