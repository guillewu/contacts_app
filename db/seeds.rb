# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

ActiveRecord::Base.transaction do
  user1 = User.create(name: 'Guillermo', email: 'foo@bar.com')
  user2 = User.create(name: 'rawr', email: 'dino@rawr.com')
  contact1 = Contact.create(name: "dad", email: "dad@gmail.com", user_id: 1)
  contact2 = Contact.create(name: "mom", email: "mom@gmail.com", user_id: 1)
  contactshare1 = ContactShare.create(user_id: 2, contact_id: 1)
  contactshare2 = ContactShare.create(user_id: 2, contact_id: 2)
end