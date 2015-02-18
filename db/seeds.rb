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

courses_locations = CoursesLocation.create([
  {course_id: 1, location_id: 1},
  {course_id: 2, location_id: 1},
  {course_id: 3, location_id: 1},
  {course_id: 1, location_id: 2},
])

cohort = Cohort.create([
  { cohort: "Godot", course_id: 1},
  { cohort: "Zelda", course_id: 1 },
  { cohort: "Peach", course_id: 1},
  { cohort: "Moo", course_id: 1}
  ])

student = Student.create([
  { user_name: "Hammer", password: "1234", password_confirmation: "1234"}
])
