FactoryGirl.define do

  factory :groups do
    name   { Faker::Team.creature }
      after(:create) do |group|
        3.times do
          user = create(:user)
          create(:user_group, user_id: user, group_id: group)
          create(:message, user_id: user, group_id: group)
        end
      end
  end

end
