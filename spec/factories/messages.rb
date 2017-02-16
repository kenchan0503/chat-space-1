FactoryGirl.define do

  factory :message do
    body       { Faker::Lorem.sentence }
    image      { Faker::Avatar.image }
    user_id    { Faker::Number.between(1, 10) }
    group_id   { Faker::Number.between(1, 10) }
  end

end
