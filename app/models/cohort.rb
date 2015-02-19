class Cohort < ActiveRecord::Base
  belongs_to :course
  has_many :students
  has_one :location, through: :course
end
