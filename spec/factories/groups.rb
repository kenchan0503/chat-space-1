require 'faker'

FactoryGirl.define do

  factory :group do
    name   { Faker::Team.creature }
    # user_ids [1,2] #検証のために残しておく。
      after(:create) do |group|
        3.times do
          user = create(:user)
          create(:users_group, user: user, group: group)
          create(:message, user: user, group: group)
        end
      end
  end

end
