FactoryBot.define do
  factory :post do
    title {Faker::Lorem.sentence}
    price {3000}

    association :user

    after(:build) do |post|
      post.video.attach(io: File.open('public/testvideo/test.mp4'), filename: 'test.mp4')
    end
  end
end