# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

puts "destroying seeds"
Balance.destroy_all
Bank_account.destroy_all
Fintoc_account.destroy_all
Movement.destroy_all
User.destroy_all
Recepient_account.destroy_all

puts "seeds destroyed"
puts "creating users"

alejandro = User.new(name: "Alejandro García Martínez", email: "a.garciamartinez12@gmail.com", password: "123456", preferred_currency: "CLP")
alejandro.save!

sofia = User.new(name: "Sofía López Rodríguez", email: "sofia.lrodriguez67@hotmail.com", password: "123456", preferred_currency: "CLP")
sofia.save!

diego = User.new(name: "Diego González Ramírez:", email: "diego.gonzalezr34@yahoo.com", password: "123456", preferred_currency: "BTC")
diego.save!

valentina = User.new(name: "Valentina Fernández Herrera", email: "valentina.fernandezherrera23@gmail.com", password: "123456", preferred_currency: "BTC")
valentina.save!

sebastian = User.new(name: "Sebastián Torres Morales", email: "s.tmorales90@aol.com", password: "123456", preferred_currency: "CLP")
sebastian.save!

camila = User.new(name: "Camila Ruiz Castro", email: "camila.rc34@gmail.com", password: "123456", preferred_currency: "CLP")
camila.save!

andres = User.new(name: "Andrés Herrera Jiménez", email: "andres.hjimenez89@hotmail.com", password: "123456", preferred_currency: "CLP")
andres.save!

isabella = User.new(name: "Isabella Paredes Navarro", email: "iparedes12@gmail.com", password: "123456", preferred_currency: "BTC")
isabella.save!

santiago = User.new(name: "Santiago Castro Silva", email: "santiago.castrosilva56@gmail.com", password: "123456", preferred_currency: "CLP")
santiago.save!

victoria = User.new(name: "Victoria Morales Gómez", email: "victoria.mgomez90@yahoo.com", password: "123456", preferred_currency: "CLP")
victoria.save!

puts "users finished"

puts "creating user bank accounts"

alejandro_bank_account = Bank_account.new(user: alejandro, general_balance: "1254500")
alejandro_bank_account.save!

sofia_bank_account = Bank_account.new(user: sofia, general_balance: "4678900")
sofia_bank_account.save!

diego_bank_account = Bank_account.new(user: diego, general_balance: "0.54238129")
diego_bank_account.save!

valentina_bank_account = Bank_account.new(user: valentina, general_balance: "1.87654321")
valentina_bank_account.save!

sebastian_bank_account = Bank_account.new(user: sebastian, general_balance: "2376800")
sebastian_bank_account.save!

camila_bank_account = Bank_account.new(user: sebastian, general_balance: "5921200")
camila_bank_account.save!

andres_bank_account = Bank_account.new(user: andres, general_balance: "3489600")
andres_bank_account.save!

isabella_bank_account = Bank_account.new(user: isabella, general_balance: "0.31592746")
isabella_bank_account.save!

santiago_bank_account = Bank_account.new(user: santiago, general_balance: "1953400")
santiago_bank_account.save!

victoria_bank_account = Bank_account.new(user: victoria, general_balance: "7285900")
victoria_bank_account.save!

puts "bank accounts finished"


