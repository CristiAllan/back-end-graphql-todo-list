FactoryBot.define do
  factory :task do
    name { Faker::Name.name }
    status { %w[todo in_progress done].sample }
  end
end
