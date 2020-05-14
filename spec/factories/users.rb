FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }
    password { 'y#N-2ie0' }
    password_confirmation { password }

    trait :admin do
      is_admin { true }
    end
  end
end
