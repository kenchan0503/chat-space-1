FactoryGirl.define do

  factory :user do
    nickname                          { Faker::name.name }
    email                             { Faker::Internet.email }
    password                          { Faker::Internet.password(6) }
    password_confirmation             password
  end

end
