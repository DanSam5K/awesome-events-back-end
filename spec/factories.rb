FactoryBot.define do
  factory :user do
    name { 'User 1' }
    email { 'user@gmail.com' }
    password { '123456' }
    password_confirmation { '123456' }
  end

  factory :events do
    name { 'Test service' }
    description { 'Spend the day enjoying our service' }
    image { 'https://picsum.photos/200/300' }
  end

  factory :attendance do
    attendee_id { 1 }
    event_id { 1 }
    city { 'Manila' }
    date { Date.current }
  end
end
