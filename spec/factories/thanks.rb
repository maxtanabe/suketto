FactoryBot.define do
  factory :thank do
    title { Faker::Lorem.sentence }
    association :user
    after(:build) do |thank|
      thank.image.attach(io: File.open('public/testimage/test.jpg'), filename: 'test.jpg')
    end
  end
end
