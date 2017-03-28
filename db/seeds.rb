# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts "seeding data"
sleep 1
User.create email: "abc@gmail.com", password: "123456", username: "abc"
User.create email: "def@gmail.com", password: "123456", username: "def"
User.create email: "xyz@gmail.com", password: "123456", username: "xyz"

# Begin Demo-Ready Seed Data
puts "generating users..."
user01 = User.new password: "secret", email: "armyofbees@example.com", username: "ArmyOfBees", avatar: File.new('seed_images/armyofbees.png')
user02 = User.new password: "secret", email: "tlock@example.com", username: "TLock", avatar: File.new('seed_images/tlock.jpg')
user03 = User.new password: "secret", email: "superstore@example.com", username: "SuperStore", avatar: File.new('seed_images/superstore.jpg')

sleep 1
puts "saving users to database..."
user01.save
user02.save
user03.save

sleep 1
puts "linking subscriptions..."
Follow.create following_id: user02.id, follower_id: user01.id
Follow.create following_id: user03.id, follower_id: user02.id
Follow.create following_id: user01.id, follower_id: user03.id

sleep 1
puts "generating products..."
Product.create store_id: user01.store.id, name: "Guitar", price: 1000000, image: File.new('seed_images/guitar.jpg'),  description: "Lorem ipsum dolor sit amet, consectetur adipisicing elit. Unde laboriosam dignissimos placeat, voluptate temporibus omnis recusandae nam autem saepe officiis!"
Product.create store_id: user01.store.id, name: "Keyboard", price: 1200000, image: File.new('seed_images/keyboard.jpg'),  description: "Lorem ipsum dolor sit amet, consectetur adipisicing elit. Atque, excepturi!"
Product.create store_id: user01.store.id, name: "Ukelele", price: 900000, image: File.new('seed_images/ukelele.jpg'),  description: "Lorem ipsum dolor sit amet, consectetur adipisicing elit. Dolorum asperiores nemo veritatis at, eos iure."

Product.create store_id: user02.store.id, name: "Honda Wave RSX", price: 24490000, image: File.new('seed_images/wave.png'),  description: "Lorem ipsum dolor sit amet, consectetur adipisicing elit. Unde laboriosam dignissimos placeat, voluptate temporibus omnis recusandae nam autem saepe officiis!"
Product.create store_id: user02.store.id, name: "Full Face Helmet", price: 400000, image: File.new('seed_images/fullface.jpg'),  description: "Lorem ipsum dolor sit amet, consectetur adipisicing elit. Atque, excepturi!"
Product.create store_id: user02.store.id, name: "3/4 Helmet", price: 200000, image: File.new('seed_images/threequarter.jpg'),  description: "Lorem ipsum dolor sit amet, consectetur adipisicing elit. Dolorum asperiores nemo veritatis at, eos iure."

Product.create store_id: user03.store.id, name: "Xoai", price: 15000, image: File.new('seed_images/xoai.jpg'),  description: "Lorem ipsum dolor sit amet, consectetur adipisicing elit. Unde laboriosam dignissimos placeat, voluptate temporibus omnis recusandae nam autem saepe officiis!"
Product.create store_id: user03.store.id, name: "Dau", price: 10000, image: File.new('seed_images/dau.jpg'),  description: "Lorem ipsum dolor sit amet, consectetur adipisicing elit. Atque, excepturi!"
Product.create store_id: user03.store.id, name: "Viet Quat", price: 10000, image: File.new('seed_images/vietquat.jpg'),  description: "Lorem ipsum dolor sit amet, consectetur adipisicing elit. Dolorum asperiores nemo veritatis at, eos iure."
Product.create store_id: user03.store.id, name: "Dua", price: 20000, image: File.new('seed_images/dua.jpg'),  description: "Lorem ipsum dolor sit amet, consectetur adipisicing elit. Dolorum asperiores nemo veritatis at, eos iure."

sleep 1
puts " ======= SUCCESS ========"
puts " === Seeding Complete ==="
