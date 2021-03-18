puts "Cleaning database"
User.destroy_all

puts "Creating Users"
User.create!(email: "user@gmail.com", password: "password")

puts "Creating Equipment"

equipment = Equipment.create!(
  type: "Frigo", 
  identifiant: "RE12", 
  serial_number: "34398935N2", 
  location: "poste C", 
  detail: "RAS", 
  commissioning_date: "21/05/2013",
  validity_qualification: "12/06/2021",
  status: "Terminée"
)