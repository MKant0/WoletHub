# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

puts "destroying seeds"
Balance.destroy_all
Movement.destroy_all
FintocAccount.destroy_all
BankAccount.destroy_all
FavoriteRecipientAccount.destroy_all
User.destroy_all


puts "seeds destroyed"
puts "creating users"

alejandro = User.new(name: "Alejandro García Martínez", email: "a.garcia12@gmail.com", password: "123456", preferred_currency: "CLP")
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

alejandro_bank_account = BankAccount.new(user: alejandro, name: "Banco de Chile")
alejandro_bank_account.save!

alejandro_bank_account2 = BankAccount.new(user: alejandro, name: "Banco Santander")
alejandro_bank_account2.save!

alejandro_bank_account3 = BankAccount.new(user: alejandro, name: "Banco BICE")
alejandro_bank_account3.save!

sofia_bank_account = BankAccount.new(user: sofia, name: "Banco Austral")
sofia_bank_account.save!

diego_bank_account = BankAccount.new(user: diego, name: "Banco Galicia")
diego_bank_account.save!

valentina_bank_account = BankAccount.new(user: valentina, name: "Banco de Chile")
valentina_bank_account.save!

sebastian_bank_account = BankAccount.new(user: sebastian, name: "Banco Santander")
sebastian_bank_account.save!

camila_bank_account = BankAccount.new(user: camila, name: "Banco de Chile")
camila_bank_account.save!


puts "bank accounts finished"


puts "creating fintoc account seeds"

alejandro_fintoc_account = FintocAccount.new(bank_account: alejandro_bank_account, name: "Cuenta Corriente",
  currency: alejandro.preferred_currency, number: "5678901234567890", account_type: "checking_account",
  official_name: "Cuneta Corriente Moneda Local", holder_id: "12.345.678-9", holder_name: alejandro.name)
alejandro_fintoc_account.save!

alejandro_fintoc_account2 = FintocAccount.new(bank_account: alejandro_bank_account2, name: "Cuenta de Ahorro",
  currency: alejandro.preferred_currency, number: "367801234868890", account_type: "saving_account",
  official_name: "Cuneta de Ahorro Moneda Local", holder_id: "12.345.678-9", holder_name: alejandro.name)
alejandro_fintoc_account2.save!

alejandro_fintoc_account3 = FintocAccount.new(bank_account: alejandro_bank_account3, name: "Cuenta de Negocio",
  currency: alejandro.preferred_currency, number: "76780263434868678", account_type: "saving_account",
  official_name: "Cuneta de Negocio Moneda Local", holder_id: "12.345.678-9", holder_name: alejandro.name)
alejandro_fintoc_account3.save!

sofia_fintoc_account = FintocAccount.new(bank_account: sofia_bank_account, name: "Cuenta Corriente",
  currency: sofia.preferred_currency, number: "9876543210987654", account_type: "checking_account",
  official_name: "Cuneta Corriente Moneda Local", holder_id: "98.765.432-1", holder_name: sofia.name)
sofia_fintoc_account.save!

diego_fintoc_account = FintocAccount.new(bank_account: diego_bank_account, name: "Cuenta de Ahorro",
  currency: diego.preferred_currency, number: "5678901234567890", account_type: "saving_account",
  official_name: "Cuneta De Ahorro Moneda Local", holder_id: "56.789.012-3", holder_name: diego.name)
diego_fintoc_account.save!

valentina_fintoc_account = FintocAccount.new(bank_account: valentina_bank_account, name: "Cuenta Corriente",
  currency: valentina.preferred_currency, number: "3210987654321098", account_type: "checking_account",
  official_name: "Cuneta Corriente Moneda Local", holder_id: "32.109.876-5", holder_name: valentina.name)
valentina_fintoc_account.save!

sebastian_fintoc_account = FintocAccount.new(bank_account: sebastian_bank_account, name: "Cuenta Corriente",
  currency: sebastian.preferred_currency, number: "7890123456789012", account_type: "checking_account",
  official_name: "Cuneta Corriente Moneda Local", holder_id: "78.901.234-6", holder_name: sebastian.name)
sebastian_fintoc_account.save!

camila_fintoc_account = FintocAccount.new(bank_account: camila_bank_account, name: "Cuenta Corriente",
  currency: camila.preferred_currency, number: "2109876543210987", account_type: "checking_account",
  official_name: "Cuneta Corriente Moneda Local", holder_id: "21.098.765-4", holder_name: camila.name)
camila_fintoc_account.save!

puts "fintoc accounts finished"

puts "creating balances"

alejandro_balance = Balance.new(available: 1254500, current: 1254500, limit: 1254500, fintoc_account: alejandro_fintoc_account)
alejandro_balance.save!

alejandro_balance2 = Balance.new(available: 6309800, current: 6309800, limit: 6309800, fintoc_account: alejandro_fintoc_account2)
alejandro_balance2.save!

alejandro_balance3 = Balance.new(available: 8876100, current: 8876100, limit: 8876100, fintoc_account: alejandro_fintoc_account3)
alejandro_balance3.save!

sofia_balance = Balance.new(available: 4678900, current: 4678900, limit: 4678900, fintoc_account: sofia_fintoc_account)
sofia_balance.save!

diego_balance = Balance.new(available: 0.54238129, current: 0.54238129, limit: 0.54238129, fintoc_account: diego_fintoc_account)
diego_balance.save!

valentina_balance = Balance.new(available: 1.87654321, current: 1.87654321, limit: 1.87654321, fintoc_account:valentina_fintoc_account)
valentina_balance.save!

sebastian_balance = Balance.new(available: 2376800, current: 2376800, limit: 2376800, fintoc_account: sebastian_fintoc_account)
sebastian_balance.save!

camila_balance = Balance.new(available: 5921200, current: 5921200, limit: 5921200, fintoc_account: camila_fintoc_account)
camila_balance.save!

puts "finished balances"


puts "creating recipient accounts"

pedro = RecipientAccount.new(holder_id: "43.210.987-2", holder_name: "Pedro Iannuchi Gómez", number: "4321098765432109", institution: "Banco del Pacífico")

maria = RecipientAccount.new(holder_id: "65.432.109-8", holder_name: "María Torres Ramírez", number: "6543210987654321", institution: "Banco Meridional")

jimena = RecipientAccount.new(holder_id: "21.098.765-4", holder_name: "Jimena Martinez Muñóz", number: "2109876543210987", institution: "Banco Austral")

puts "recipient accounts finished"


puts "creating movements"

movement1 = Movement.new(bank_account: alejandro_bank_account, fintoc_account: alejandro_fintoc_account, currency: "BTC", amount: 0.000487, description: "La plata que le debia al Pedro",
  transaction_date: "2023-06-19".to_date, movement_type: "transaction", pending: false, recipient_account: pedro)
movement1.save!

movement2 = Movement.new(bank_account: alejandro_bank_account, fintoc_account: alejandro_fintoc_account, currency: "CLP", amount: 150000, description: "El prestamo para la mesa nueva",
  transaction_date: "2023-04-23".to_date, movement_type: "transaction", pending: false, recipient_account: maria)
movement2.save!

movement3 = Movement.new(bank_account: alejandro_bank_account, fintoc_account: alejandro_fintoc_account, currency: "CLP", amount: 10000, description: "por el helado",
  transaction_date: "2023-01-15".to_date, movement_type: "transaction", pending: false, recipient_account: jimena)
movement3.save!

movement4 = Movement.new(bank_account: alejandro_bank_account, fintoc_account: alejandro_fintoc_account, currency: "CLP", amount: 237800, description: "para el auto de mama",
  transaction_date: "2023-01-13".to_date, movement_type: "transaction", pending: false, recipient_account: pedro)
movement4.save!

movement5 = Movement.new(bank_account: alejandro_bank_account, fintoc_account: alejandro_fintoc_account, currency: "CLP", amount: 133800, description: "regalos de navidad",
  transaction_date: "2022-12-23".to_date, movement_type: "transaction", pending: false, recipient_account: maria)
movement5.save!

puts "movements finished"

puts "creating favorites"

fav1 = FavoriteRecipientAccount.new(user: alejandro, recipient_account: pedro)
fav1.save!

fav2 = FavoriteRecipientAccount.new(user: alejandro, recipient_account: maria)
fav2.save!

fav3 = FavoriteRecipientAccount.new(user: alejandro, recipient_account: jimena)
fav3.save!

puts "finished favorites"
