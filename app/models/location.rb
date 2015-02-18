class Location < ActiveRecord::Base
  has_and_belongs_to_many :courses
  has_many :cohorts, through: :courses
  # has_many :students, through: :cohorts, through: :courses
end
