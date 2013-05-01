# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# Added by Refinery CMS Pages extension
Refinery::Pages::Engine.load_seed

puts 'setting up super user'
#Create User Roles
Role.create(:title => 'Refinery')
Role.create(:title => 'Superuser')
Role.create(:title => 'Admin')
Role.create(:title => 'Moderator')
Role.create(:title => 'Member')


User.create(:email=>'oliveadmin@gmail.com', :password=>'olivepass')  ##creating first user
user2 = User.create(:email=>'olivemoderator@gmail.com', :password=>'olivepass')  ##creating first user
user3 = User.create(:email=>'olivemember@gmail.com', :password=>'olivepass')  ##creating first user
user4 = User.create(:email=>'olivenewbe@gmail.com', :password=>'olivepass')  ##creating first user


#Assign user roles

user = User.first
user.roles << Role.find_by_title('Refinery')
user.roles << Role.find_by_title('Superuser')
user.roles << Role.find_by_title('Admin')
user.save

# user = User.find_by_email('olivemoderator@gmail.com')
user2.roles << Role.find_by_title('Moderator')
user2.save

# user = User.find_by_email('olivemember@gmail.com')
user3.roles << Role.find_by_title('Member')
user3.save

user4.save
