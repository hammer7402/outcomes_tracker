# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Student.destroy_all
Admin.destroy_all


student = Student.create([
  { user_name: "Hammer", password: "1234", password_confirmation: "1234"}
])

admin = Admin.create([
  { user_name: "Mike", password: "abcd", password_confirmation: "abcd"}
])
