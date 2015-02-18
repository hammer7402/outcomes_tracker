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
  { course: "UXDI" }
  ])

# INSERT INTO courses_locations
#   (course_id, location_id)
# VALUES
#   (1, 1),
#   (2, 1),
#   (3, 1),
#   (1, 2);
c1 = Course.first
c2 = Course.find(2)
c3 = Course.find(3)

# c1.locations << l1 << l2
Location.first.courses << c1 << c2 << c3
Location.find(2).courses << c1


# courses_locations = CoursesLocation.create([
#   {course_id: 1, location_id: 1},
#   {course_id: 2, location_id: 1},
#   {course_id: 3, location_id: 1},
#   {course_id: 1, location_id: 2},
# ])

cohort = Cohort.create([
  { cohort: "Godot", course_id: 1},
  { cohort: "Zelda", course_id: 1 },
  { cohort: "Peach", course_id: 1},
  { cohort: "Moo", course_id: 1}
  ])

student = Student.create([
  { user_name: "Hammer", password: "1234", password_confirmation: "1234"}
])
