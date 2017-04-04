puts "seeding data"
sleep 1

# Begin Demo-Ready Seed Data
##
## USE THIS FORMULA TO ADD YOUR SEEDS. Put images in "seed_images" folder first.
##
puts "generating users..."
user01 = User.new password: "secret", email: "armyofbees@example.com", username: "ArmyOfBees", avatar: File.new('seed_images/armyofbees.png')
user02 = User.new password: "secret", email: "tlock@example.com", username: "TLock", avatar: File.new('seed_images/tlock.jpg')
user03 = User.new password: "secret", email: "superstore@example.com", username: "SuperStore", avatar: File.new('seed_images/superstore.jpg')

puts "saving users to database..."
user01.save
user02.save
user03.save
Store.update_all(description: "Lorem ipsum dolor sit amet, consectetur adipisicing elit. Unde totam, tempora perferendis esse natus animi fuga sit voluptatibus inventore odit nihil cum quae ad provident debitis praesentium aspernatur laboriosam nulla eos assumenda iste, voluptatem obcaecati ipsa. Mollitia assumenda tempora earum deleniti quibusdam. Maxime tempora debitis est porro? Non, nobis, incidunt.")

puts "linking subscriptions..."
# This step is optional

Follow.create following_id: user02.id, follower_id: user01.id
Follow.create following_id: user03.id, follower_id: user02.id
Follow.create following_id: user01.id, follower_id: user03.id

puts "adding store cover photos..."
Store.find(user01.store.id).update(cover_photo: File.new('seed_images/hive.jpg'))
Store.find(user02.store.id).update(cover_photo: File.new('seed_images/tlock_cover.jpg'))
Store.find(user03.store.id).update(cover_photo: File.new('seed_images/super_cover.jpg'))

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

puts "generating Order statuses..."
OrderStatus.delete_all
OrderStatus.create! id: 1, name: "In Progress"
OrderStatus.create! id: 2, name: "Placed"
OrderStatus.create! id: 3, name: "Shipped"
OrderStatus.create! id: 4, name: "Cancelled"

puts " ======= SUCCESS ========"
puts " === Seeding Complete ==="
