# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

school_login = User.create(username: "mySchool", password_hash: "1234", level: "admin")
Admin1 = User.create(username: "Admin", password_hash: "1234", level: "admin")
Parent1 = User.create(username: "Parent", password_hash: "1234", level: "parent")
Student1 = User.create(username: "Student", password_hash: "1234", level: "student")
