# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# adding new agent to database
5.times do
  #enregistrement de 100 agents dans la bse de données
  Agent.create(
    name: Faker::Name.unique.name,
    prenom: Faker::Name.name,
    phone: Faker::PhoneNumber.phone_number,
    matricule: SecureRandom.hex(4),
    grade_id: rand(2),
    unite_id: rand(6),
    age: rand(100),
    sexe: Faker::Gender.binary_type,
    region_id: rand(10)
  )
end
