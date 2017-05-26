require 'faker'

20.times do
  User.create!( :name => Faker::HarryPotter.character,
                :username => Faker::Internet.user_name,
                :email => Faker::Internet.email,
                :password => 'password'
                )
end