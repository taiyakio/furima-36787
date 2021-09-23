FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials(number: 2)}
    email                 {Faker::Internet.free_email}
    password              {Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    first_name            {Gimei.first}
    last_name             {Gimei.last}
    fn_furigana           {Gimei.first.katakana}
    ln_furigana           {Gimei.last.katakana}
    birthdate             {Faker::Date.between(from: '1930-01-01', to: '2016-12-31')}
  end
end
