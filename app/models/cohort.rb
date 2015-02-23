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

  def send_email
    if days_past_cohort == 100
      Student.all.each do |student|
        Pony.mail(:to => student.email, :from => 'iramak@icloud.com', :subject => 'hi', :body => "'It's been 100 days since your graduation from General Assembly! We would love to hear how you are doing. Please complete your personal survey here: 'students/#{student.id}/survey'." )
      end
    end
  end
end
