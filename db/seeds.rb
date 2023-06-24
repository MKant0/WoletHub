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
