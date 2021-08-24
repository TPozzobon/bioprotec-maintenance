puts "Cleaning database"
User.destroy_all
Equipment.destroy_all
ExternalInterlocutor.destroy_all

puts "Creating Users"
User.create!(email: "user@gmail.com", password: "password", visa: "BBB", admin: false, status: "inactif")
User.create!(email: "admin@gmail.com", password: "password", visa: "AAA", admin: true)

puts "Creating Equipment"

equipment = Equipment.create!(
  name: "Réfrigérateur", 
  identifiant: "RE12", 
  serial_number: "34398935N2", 
  location: "Réception kits", 
  detail: "250V", 
  commissioning_date: "21/05/2013",
  validity_qualification: "12/06/2021",
  status: "Actif"
)

equipment = Equipment.create!(
  name: "Réfrigérateur", 
  identifiant: "RE9", 
  serial_number: "34391635N2", 
  location: "Réception kits", 
  detail: "250V", 
  commissioning_date: "21/05/2016",
  validity_qualification: "12/06/2021",
  status: "Actif"
)

equipment = Equipment.create!(
  name: "Etuve", 
  identifiant: "ET2", 
  serial_number: "IHEFIHE86", 
  location: "Contrôle qualité", 
  detail: "Problème de maintien de la température", 
  commissioning_date: "12/09/2020",
  validity_qualification: "31/03/2022",
  status: "Actif"
)

equipment = Equipment.create!(
  name: "Manomètre", 
  identifiant: "MN1", 
  serial_number: "KZFEBFE99", 
  location: "ZAC", 
  detail: "", 
  commissioning_date: "12/01/2024",
  validity_qualification: "16/03/2023",
  status: "Actif"
)

puts "Creating External Interlocutors"

external_interlocutor = ExternalInterlocutor.create!(
  name: "Gérard Brodar", 
  company: "Mediplan", 
  phone_number: "0400000000", 
  mobile_number: "0600000000", 
  email: "brodar@mediplan.com"
)

external_interlocutor = ExternalInterlocutor.create!(
  name: "John John", 
  company: "Sauermann", 
  phone_number: "0400000000", 
  mobile_number: "0600000000", 
  email: "john@sauermann.com"
)

external_interlocutor = ExternalInterlocutor.create!(
  name: "Cédric Taint", 
  company: "Mediplan", 
  phone_number: "0400000000", 
  mobile_number: "0600000000", 
  email: "taint@mediplan.com",
  detail: "Prestataire de Médiplan"
)

external_interlocutor = ExternalInterlocutor.create!(
  name: "Bob Bob", 
  company: "Merck Millipore", 
  phone_number: "0400000000", 
  mobile_number: "0600000000", 
  email: "bob@merck.com",
  detail: "Ne se déplace que les après-midi"
)

puts "Finished!"
