FactoryBot.define do
  factory :exchange_rate do
    rate       { Faker::Number.normal(mean: 10, standard_deviation: 3.5) }
    expired_at { Time.current }
  end
end
