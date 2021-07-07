require_relative "../config/environment"
require_relative "../app/models/user.rb"
require_relative "../app/models/locker.rb"
require_relative "../app/models/building.rb"

Building.destroy_all
User.destroy_all
Locker.destroy_all

u1 = User.create(name: "Dan")
u2 = User.create(name: "Tee")

l1 = Locker.create(name: "Davy Jones Locker", location:"Bottom of the sea!")
l2 = Locker.create(name: "Weenie Hut Jr's", location:"Bikini Bottom!")
l3 = Locker.create(name: "Super Weenie Hut Jr'", location:"Bikini Bottom!")
l4 = Locker.create(name: "The Salty Spitoon", location:"Goo Lagoon!")
l5 = Locker.create(name: "Diary of Ms.TMPR", location:"The Stack")



b1 = Building.create(user_id:u1.id, locker_id: l1.id)
b2 = Building.create(user_id:u2.id, locker_id: l1.id)
b3 = Building.create(user_id:u1.id, locker_id: l2.id)
b4 = Building.create(user_id:u2.id, locker_id: l3.id)
b5 = Building.create(user_id:u2.id, locker_id: l4.id)
b6 = Building.create(user_id:u1.id, locker_id: l3.id)


puts "bang bang"