FactoryBot.define do
  factory :user do
  	n = Faker::Friends.character()

		first_name { n.split.first }
		last_name { n.split.last }
		email { Faker::Internet.email }
		password 'foobar'
  end
end
