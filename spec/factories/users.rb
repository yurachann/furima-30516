FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials}
    email                 {Faker::Internet.free_email}
    password              {Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    family_name           {}     
    first_name            {}
    family_name_read      {}
    first_name_read       {}
    birth_date            {Faker::Date.between(from: '1930-01-01', to: '2020-12-31')}
  end
end
