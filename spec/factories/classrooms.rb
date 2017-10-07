FactoryGirl.define do
  factory(:classroom) do
    name  { Faker::Lorem.word }
    year  { Faker::Number.between(2000, 2100) }
    shift { Faker::Number.between(0, 4) }
  end
end
