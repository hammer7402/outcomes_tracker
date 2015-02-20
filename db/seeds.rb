Admin.destroy_all
Student.destroy_all
Cohort.destroy_all
Course.destroy_all
Location.destroy_all

admins = Admin.create([
  {user_name: "mike",    password: "abcd",    password_confirmation: "abcd"},
  {user_name: "melodie", password: "Melodie", password_confirmation: "Melodie"},
  {user_name: "kamari",  password: "Kamari",  password_confirmation: "Kamari"},
  {user_name: "aliya",   password: "Aliya",   password_confirmation: "Aliya"}
])

locations = Location.create([
  {city: "NYC"},
  {city: "Boston"},
  {city: "Atlanta"},
  {city: "Chicago"}
])

courses = DissemblyApiHelper.courses
courses.each {|course_data| Course.create(id: course_data[:id], course: course_data[:number])} 

GA_OFFICIAL_OUTCOMES_RATE = 0.92 # formerly 0.95

def employed?
  rand < GA_OFFICIAL_OUTCOMES_RATE
end

def random_job
  [
    "JFSD", "JFSD", "JFSD", "JFSD",
    "Web Developer", "Web Developer", "Web Developer", "Web Developer",
    "FE Dev", "FE Dev", "FE Dev",
    "Self-employed", "Self-employed", "Self-employed",
    "WDI TA", "WDI TA",
    "CTO"
  ].sample
end

def random_date_after(date)
  after = (1..100).to_a.sample
  date.advance(days: after)
end

cohorts = DissemblyApiHelper.cohorts
cohorts.each do |cohort_data|
  cohort = Cohort.create(
    cohort:  cohort_data[:number],
    ends_on: Date.parse(cohort_data[:dates][:ends_on]),
    course:  Course.find_by(course: cohort_data[:course])
  )
  students = DissemblyApiHelper.students_in_cohort cohort_data[:id]
  students.each do |student_data|
      student = Student.create({
      first:                 student_data[:data][:first],
      last:                  student_data[:data][:last],
      email:                 student_data[:contact][:email],
      phone:                 student_data[:contact][:phone],
      password:              "password", 
      password_confirmation: "password", 
      cohort:                cohort
    })

    student.employ! random_job, random_date_after(cohort.ends_on) if employed?
    puts student.employment_type.to_s + " " + student.employment_start_date.to_s
  end
end



