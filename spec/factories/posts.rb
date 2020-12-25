FactoryBot.define do
  factory :post do
    title { Faker::Lorem.sentence }
    price { 3000 }

    association :user

    after(:build) do |post|
      post.video.attach(io: File.open('public/testvideo/test.MOV'), filename: 'test.MOV')
    end
  end
end
