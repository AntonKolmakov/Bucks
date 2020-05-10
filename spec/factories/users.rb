FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }
    password { 'y#N-2ie0' }
    password_confirmation { password }
  end
end
