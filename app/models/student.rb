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

end
