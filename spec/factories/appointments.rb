FactoryBot.define do
  factory :appointment do
  	date { Faker::Time.forward(7, :morning) }
  	title { Faker::Lorem.sentence(1, true, 1) }
  	notes { Faker::Lorem.sentence(10, true, 10) }
  	user_id nil
   end
end
