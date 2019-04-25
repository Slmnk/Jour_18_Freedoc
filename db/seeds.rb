# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


require 'faker'

# supprime toutes les entrées
Doctor.destroy_all
Patient.destroy_all
City.destroy_all
Appointment.destroy_all
Specialty.destroy_all
DoctorSpecialty.destroy_all

# Créé 10 cities
10.times do
  city = City.create!(city_name: Faker::Address.city)
end

# Créé 10 docteurs
10.times do
  doctor = Doctor.create!(first_name: Faker::Name.unique.first_name , last_name: Faker::Name.unique.last_name, zip_code: Faker::Address.zip_code, city_id: City.all.sample.id)
end

# Créé 10 patients
10.times do
  patient = Patient.create!(first_name: Faker::Name.unique.first_name , last_name: Faker::Name.unique.last_name, city_id: City.all.sample.id )
end

# Créé 10 appointments associés aux id des patients et docteurs
10.times do
  appointment = Appointment.create!(date: Faker::Date.forward , patient_id:  Patient.all.sample.id, doctor_id: Doctor.all.sample.id, city_id: City.all.sample.id)
end

# Créé 10 specialties associés aux id des patients et docteurs
10.times do
  specialty = Specialty.create!(name: Faker::Lorem.word)
end

# Créé 10 liens doctor_specialties associés aux id des specialties et docteurs
10.times do
  doctor_specialty = DoctorSpecialty.create!(specialty_id: Specialty.all.sample.id, doctor_id: Doctor.all.sample.id)
end


