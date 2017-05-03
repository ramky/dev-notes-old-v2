FactoryGirl.define do
  factory :account do
    name                  'ram iyer'
    email                 'ramky.iyer@yahoo.com'
    password              '1234'
    password_confirmation '1234'
  end

  factory :topic do
    name               Faker::Lorem.words(4).join(' ')
    description        Faker::Lorem.sentences(1).join(' ')
  end
end
