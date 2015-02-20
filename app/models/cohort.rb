class Cohort < ActiveRecord::Base
  belongs_to :course
  has_many   :students
  has_one    :location, through: :course

  def days_past_cohort
    (Date.today-ends_on.to_date).to_i
  end

  def students_employed_by_day(days)
    students.select {|student| student.was_employed_after_day days}.length
  end


  def percent_employed_by_day(days)
    students_len = students.length
    employed_count = 0

    employed_count = students_employed_by_day(days)

    percent = employed_count.to_f/students_len
    percent.round(2)*100
  end

  def percent_unemployed_by_day(days)
    employed = percent_employed_by_day(days)
    100-employed
  end

end
