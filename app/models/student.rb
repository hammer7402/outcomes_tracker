class Student < ActiveRecord::Base
  has_secure_password
  belongs_to :cohort
  has_one :course, through: :cohort

  def is_employed?
    # TODO: (PJ) should this key off of date or employment type?
    #       Right now it's date.
    !employment_start_date.nil?
    # employment_type == "unemployed"
  end

  def has_been_employed
    if is_employed?
      (Date.today - employment_start_date).to_i
    else
      0
    end
  end

  def has_been_employed_days(days)
    has_been_employed >= days
  end

  def has_been_employed_30_days?
    has_been_employed_days(30)
  end

  def has_been_employed_60_days?
    has_been_employed_days(60)
  end

  def has_been_employed_90_days?
    has_been_employed_days(30)
  end

  def was_employed_after_day(days)
    if self.is_employed?
      cohort_graduated_on = Date.parse self.cohort.ends_on
      employed_on = self.employment_start_date
      (employed_on - cohort_graduated_on).to_i <= days
    end
  end

  def was_employed_after_30_days?
    was_employed_after_day(30)
  end

  def was_employed_after_60_days?
    was_employed_after_day(60)
  end

  def was_employed_after_90_days?
    was_employed_after_day(90)
  end
end
