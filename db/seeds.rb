# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Clinic.delete_all
 clinics = Clinic.create([
  { title: "Nunez Dental Care", street: "1234 street", city: "Pasadena"},
  { title: "Sanchez Dental Care", street: "567 Street", city: "Los Angeles"},
  ])