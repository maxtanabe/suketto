FactoryBot.define do
  factory :user do
    nickname              {"田辺"}
    email                 {Faker::Internet.free_email}
    password              { '1a' + Faker::Internet.password(min_length: 7)}
    password_confirmation {password}
    birth_date            {"1990-10-31"}
  end
end
