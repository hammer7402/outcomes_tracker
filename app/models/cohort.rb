class Cohort < ActiveRecord::Base
  belongs_to :course
  has_many :students
  has_one :location, through: :course

  def days_past_cohort
    (Date.today-ends_on.to_date).to_i
  end

  # TODO: (PJ) should rename this students_employed_by_day(days)
  def student_count(days)
    students.select {|student| student.was_employed_after_day days}.length
  end

  # TODO: (PJ) should rename this percent_students_employed_by_day(days)
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
