class Course < ActiveRecord::Base
  has_many :cohorts
  has_and_belongs_to_many :locations
  has_many :students, through: :cohorts

  def students_employed_by_day(days)
    students.select {|student| student.was_employed_after_day days}.length
  end

  def percent_employed_by_day(days)
    students_len = students.length

    employed_count = 0

    employed_count = students_employed_by_day(days)

    percent = employed_count.to_f/students_len
    (percent.round(2)*100).to_i
  end

  def percent_unemployed_by_day(days)
    employed = percent_employed_by_day(days)
    100-employed
  end
end
