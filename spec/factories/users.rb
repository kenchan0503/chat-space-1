FactoryGirl.define do

  pass = Faker::Internet.password(6)

  factory :user do
    nickname                          { Faker::Name.name }
    email                             { Faker::Internet.email }
    password                          pass
    password_confirmation             pass
  end

end
