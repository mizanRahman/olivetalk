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




users = []

users << User.create(:email=>"iyerushalmi@gmail.com", :password=>'olivepass')
users << User.create(:email=>"orenradio@gmail.com", :password=>'olivepass')
users << User.create(:email=>"alchemitt@gmail.com", :password=>'olivepass')
users << User.create(:email=>"sameera078@gmail.com", :password=>'olivepass')
users << User.create(:email=>"asnaoufal@gmail.com", :password=>'olivepass')
users << User.create(:email=>"raviv.zvi@gmail.com", :password=>'olivepass')
users << User.create(:email=>"evonneliew@gmail.com", :password=>'olivepass')
users << User.create(:email=>"pkmaguire@gmail.com", :password=>'olivepass')
users << User.create(:email=>"dballout@gmail.com", :password=>'olivepass')
users << User.create(:email=>"smouakkad@gmail.com", :password=>'olivepass')
users << User.create(:email=>"kkeithmpd@gmail.com", :password=>'olivepass')
users << User.create(:email=>"obustami@gmail.com", :password=>'olivepass')
users << User.create(:email=>"alimalik1984@gmail.com", :password=>'olivepass')
users << User.create(:email=>"morancohen3@gmail.com", :password=>'olivepass')
users << User.create(:email=>"sshahandeh@gmail.com", :password=>'olivepass')
users << User.create(:email=>"sepitemerchi@gmail.com", :password=>'olivepass')
users << User.create(:email=>"wehrenfennig@gmail.com", :password=>'olivepass')
users << User.create(:email=>"aranaghapour@gmail.com", :password=>'olivepass')
users << User.create(:email=>"ben.jakovljevic@yahoo.com", :password=>'olivepass')
users << User.create(:email=>"tierneyanderson@gmail.com", :password=>'olivepass')
users << User.create(:email=>"nahian.taha@gmail.com", :password=>'olivepass')
users << User.create(:email=>"icyaaron72588@yahoo.com", :password=>'olivepass')
users << User.create(:email=>"nfarruci@gmail.com", :password=>'olivepass')
users << User.create(:email=>"pham.kevin101@gmail.com", :password=>'olivepass')
users << User.create(:email=>"noah.saeedy@gmail.com", :password=>'olivepass')
users << User.create(:email=>"spencer.resh@hotmail.com", :password=>'olivepass')
users << User.create(:email=>"mariam.a.ansari@gmail.com", :password=>'olivepass')
users << User.create(:email=>"daamanthandi@gmail.com", :password=>'olivepass')
users << User.create(:email=>"ztune@uci.edu", :password=>'olivepass')
users << User.create(:email=>"azahlan@gmail.com", :password=>'olivepass')
users << User.create(:email=>"seltaire@gmail.com", :password=>'olivepass')
users << User.create(:email=>"coreyfeinstein@gmail.com", :password=>'olivepass')

users.each do |user|

	user.roles << Role.find_by_title('Member')
	user.save
	puts "user inserted with member role: #{user.email} "
	
end

user1 = User.first
user1.roles << Role.find_by_title('Refinery')
user1.roles << Role.find_by_title('Superuser')
user1.roles << Role.find_by_title('Admin')
user1.save

user1 = User.create(:email=>'oliveadmin@gmail.com', :password=>'olivepass')  ##creating first user
user2 = User.create(:email=>'olivemoderator@gmail.com', :password=>'olivepass')  ##creating first user
user3 = User.create(:email=>'olivemember@gmail.com', :password=>'olivepass')  ##creating first user
user4 = User.create(:email=>'olivenewbe@gmail.com', :password=>'olivepass')  ##creating first user


#Assign user roles

# user = User.first
user1.roles << Role.find_by_title('Refinery')
user1.roles << Role.find_by_title('Superuser')
user1.roles << Role.find_by_title('Admin')
user1.save

# user = User.find_by_email('olivemoderator@gmail.com')
user2.roles << Role.find_by_title('Moderator')
user2.save

# user = User.find_by_email('olivemember@gmail.com')
user3.roles << Role.find_by_title('Member')
user3.save

user4.save


