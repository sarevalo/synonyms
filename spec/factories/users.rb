FactoryBot.define do
  factory :user do
    name { 'admin' }
    email { Faker::Internet.unique.free_email }
    password { '$dm!nhola123' }
  end
end
