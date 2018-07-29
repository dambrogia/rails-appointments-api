FactoryBot.define do
  factory :guest do
    # when when running create or create_list, pass these in as params
    appointment_id nil
    user_id nil
  end
end
