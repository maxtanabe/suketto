FactoryBot.define do
  factory :user do
    nickname              { '田辺' }
    email                 { Faker::Internet.free_email }
    password              { '1a' + Faker::Internet.password(min_length: 7) }
    password_confirmation { password }
    birth_date            { '1990-10-31' }
    phone_number { "09011112222" }
    area_id { 1 }
    address { '福井市' }
  end
end
