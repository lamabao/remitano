FactoryGirl.define do
	factory :user do
	    username  { Faker::Internet.email }
	    password  { Faker::Internet.password }
	end
  	factory :invalid_user, parent: :user do |f|
  		username nil
  		password nil
	end
	factory :invalid_useremail, parent: :user do |f|
  		username Faker::Name.name
	end
	factory :userloginsucess, parent: :user do |f|
  		username "demo@gmail.com"
  		password "123456789"
	end
	factory :userloginerror, parent: :user do |f|
  		username "demo@gmail.com"
  		password "1234567890"
	end
	
end