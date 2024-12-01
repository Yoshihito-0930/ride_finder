FactoryBot.define do
  factory :user do
    name {'test'}
    sequence(:email) {|n| "user_#{n}@example.com"} 
    sequence(:uid, "uid_1")
    provider {'hogehoge'}
  end
end