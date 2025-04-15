FactoryBot.define do
  factory :user do
    email_address { 'user@example.com' }
    password { 'securepassword' }
    password_confirmation { 'securepassword' }
  end
end