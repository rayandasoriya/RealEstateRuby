# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
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
  email: 'hunter@realestate.com',
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