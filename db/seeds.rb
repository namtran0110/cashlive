# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create email: "abc@gmail.com", password: "123456", username: "abc"
User.create email: "def@gmail.com", password: "123456", username: "def"
User.create email: "xyz@gmail.com", password: "123456", username: "xyz"

# Begin Demo-Ready Seed Data
User.create email: "armyofbees@example.com", password: "secret", username: "ArmyOfBees"
User.create email: "tlock@example.com", password: "secret", username: "TLock"
User.create email: "superstore@example.com", password: "secret", username: "SuperStore"
