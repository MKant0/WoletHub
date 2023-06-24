# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

puts "destroying seeds"
Balance.destroy_all
BankAccount.destroy_all
FintocAccount.destroy_all
Movement.destroy_all
User.destroy_all
RecipientAccount.destroy_all

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


puts "users finished"

puts "creating user bank accounts"

alejandro_bank_account = BankAccount.new(user: alejandro)
alejandro_bank_account.save!

sofia_bank_account = BankAccount.new(user: sofia)
sofia_bank_account.save!

diego_bank_account = BankAccount.new(user: diego)
diego_bank_account.save!

valentina_bank_account = BankAccount.new(user: valentina)
valentina_bank_account.save!

sebastian_bank_account = BankAccount.new(user: sebastian)
sebastian_bank_account.save!

camila_bank_account = BankAccount.new(user: camila)
camila_bank_account.save!


puts "bank accounts finished"

puts "creating fintoc account seeds"

alejandro_fintoc_account = FintocAccount.new(bank_account: alejandro_bank_account, name: "Cuenta Corriente",
  amount: 1254500, currency: alejandro.preferred_currency, number: "5678901234567890", account_type: "checking_account",
  official_name: "Cuneta Corriente Moneda Local", holder_id: "12.345.678-9", holder_name: alejandro.name)
alejandro_fintoc_account.save!

sofia_fintoc_account = FintocAccount.new(bank_account: sofia_bank_account, name: "Cuenta Corriente",
  amount: 4678900, currency: sofia.preferred_currency, number: "9876543210987654", account_type: "checking_account",
  official_name: "Cuneta Corriente Moneda Local", holder_id: "98.765.432-1", holder_name: sofia.name)
sofia_fintoc_account.save!

diego_fintoc_account = FintocAccount.new(bank_account: diego_bank_account, name: "Cuenta de Ahorro",
  amount: 0.54238129, currency: diego.preferred_currency, number: "5678901234567890", account_type: "saving_account",
  official_name: "Cuneta De Ahorro Moneda Local", holder_id: "56.789.012-3", holder_name: diego.name)
diego_fintoc_account.save!

valentina_fintoc_account = FintocAccount.new(bank_account: valentina_bank_account, name: "Cuenta Corriente",
  amount: 1.87654321, currency: valentina.preferred_currency, number: "3210987654321098", account_type: "checking_account",
  official_name: "Cuneta Corriente Moneda Local", holder_id: "32.109.876-5", holder_name: valentina.name)
valentina_fintoc_account.save!

sebastian_fintoc_account = FintocAccount.new(bank_account: sebastian_bank_account, name: "Cuenta Corriente",
  amount: 2376800, currency: sebastian.preferred_currency, number: "7890123456789012", account_type: "checking_account",
  official_name: "Cuneta Corriente Moneda Local", holder_id: "78.901.234-6", holder_name: sebastian.name)
sebastian_fintoc_account.save!

camila_fintoc_account = FintocAccount.new(bank_account: camila_bank_account, name: "Cuenta Corriente",
  amount: 5921200, currency: camila.preferred_currency, number: "2109876543210987", account_type: "checking_account",
  official_name: "Cuneta Corriente Moneda Local", holder_id: "21.098.765-4", holder_name: camila.name)
camila_fintoc_account.save!

puts "fintoc accounts finished"

puts "creating movements"

movement1 = Movement.new(fintoc_account: sofia_fintoc_account, currency: "BTC", amount: 0.000487, description: "La plata que le debia a Pedro", transaction_date: 2023-06-19, )
