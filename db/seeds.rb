require 'faker'

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).

# Examples:

#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create!([{
  first_name: 'Admin', 
  last_name: 'Admin', 
  email: 'admin@realestate.com',
  password: 'password', 
  is_hunter: 0, 
  is_realtor: 0, 
  is_admin: 1,
  phone: '1800-MY-ADMIN',
  contact_method: 'text'
}])

User.create!([{
  first_name: 'realtor', 
  last_name: 'x', 
  email: 'realtor@realestate.com',
  password: 'password', 
  is_hunter: 0, 
  is_realtor: 1, 
  is_admin: 0,
  phone: '1800-MY-REALTOR',
  contact_method: 'text'
}])

User.create!([{
  first_name: 'hunter', 
  last_name: 'y', 
  email: 'hunter@realestate.com',
  password: 'password', 
  is_hunter: 1, 
  is_realtor: 0, 
  is_admin: 0,
  phone: '1800-MY-HUNTER',
  contact_method: 'text'
}])

50.times do
  User.create(
    first_name: Faker::Name.first_name, 
    last_name: Faker::Name.last_name, 
    email: Faker::Internet.email,
    password: 'password', 
    is_hunter: Faker::Boolean.boolean, 
    is_realtor: Faker::Boolean.boolean, 
    is_admin: 0,
    phone: Faker::PhoneNumber.phone_number,
    contact_method: 'email'
  )
end

30.times do
  Company.create(
    name: Faker::Company.name,
    website: Faker::Internet.url,
    address: Faker::Address.full_address,
    size: Faker::Number.between(0, 4),
    year_founded: Faker::Number.between(1900, 2018),
    revenue: Faker::Number.between(0, 3),
    synopsis: Faker::Dota.quote
  )
end
