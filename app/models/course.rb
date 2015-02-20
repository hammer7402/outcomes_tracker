class Course < ActiveRecord::Base
  has_many :cohorts
  has_and_belongs_to_many :locations
  has_many :students, through: :cohorts

  def student_count(days)
    employed_count = 0
    students.each do |student|
      start_date = student.employment_start_date.to_date
      if start_date || ((Date.today-start_date).to_i <= days)
        if student.is_employed?
          employed_count+=1
        end
      end
    end
    employed_count
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
