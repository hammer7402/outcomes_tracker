class Course < ActiveRecord::Base
  has_many :cohorts
  has_and_belongs_to_many :locations
  has_many :students, through: :cohorts

  def student_count(days)
    students.select {|student| student.was_employed_after_day days}.length
  end

  def percent_employed(days)
    students_len = students.length

    employed_count = 0

    employed_count = student_count(days)

    percent = employed_count.to_f/students_len
    percent.round(2)
  end

  def percent_unemployed(days)
    employed = percent_employed(days)
    1-employed
  end
end
