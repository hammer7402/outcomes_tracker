# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Admin.destroy_all
Student.destroy_all
Cohort.destroy_all
Course.destroy_all
Location.destroy_all

admin = Admin.create([
  { user_name: "mike", password: "abcd", password_confirmation: "abcd"},
  { user_name: "melodie", password: "Melodie", password_confirmation: "Melodie"},
  { user_name: "kamari", password: "Kamari", password_confirmation: "Kamari"},
  { user_name: "aliya", password: "Aliya", password_confirmation: "Aliya"}
])

location = Location.create([
  {city: "NYC"},
  {city: "Boston"},
  {city: "Atlanta"},
  {city: "Chicago"}
])

course = Course.create([
  { course: "WDI" },
  { course: "PMI" },
  { course: "UXDI" },
  { course: "DS" },
  { course: "FEWD" }
  ])

url = "http://104.131.73.180/api/v1/cohorts"
cohorts = HTTParty.get(url)["cohorts"]
length = cohorts.length
course_id = 0

cohorts.each_with_index do |cohort, i|
  course = cohorts[i]["course"]
  name = cohorts[i]["name"]
  end_date = cohorts[i]["dates"]["ends_on"]
  if course == 'WDI'
    course_id = 1
  elsif course == 'UXDI'
    course_id = 2
  elsif course == 'PMI'
    course_id = 3
  elsif course == 'DS'
    course_id = 4
  elsif course == 'FEWD'
    course_id = 5
  else
    course_id = 0
  end

  squadron = Cohort.create([
    { cohort: name, ends_on: end_date, course_id: course_id},
    ])

  url_students = "http://104.131.73.180/api/v1/cohorts/#{i}/students"
  students = HTTParty.get(url)["students"]
  students.each do |student|
    first = student["data"]["first"]
    last = student["data"]["last"]
    email = student["contact"]["email"]
    phone = student["contact"]["phone"]
    student = Student.create([
      { first: first, last: last, email: email, phone: phone, password: last, password_confirmation: last }
    ])
  end
end



# INSERT INTO courses_locations
#   (course_id, location_id)
# VALUES
#   (1, 1),
#   (2, 1),
#   (3, 1),
#   (1, 2);
# c1 = Course.first
# c2 = Course.find(2)
# c3 = Course.find(3)

# c1.locations << l1 << l2
# Location.first.courses << c1 << c2 << c3
# Location.find(2).courses << c1


# courses_locations = CoursesLocation.create([
#   {course_id: 1, location_id: 1},
#   {course_id: 2, location_id: 1},
#   {course_id: 3, location_id: 1},
#   {course_id: 1, location_id: 2},
# ])

