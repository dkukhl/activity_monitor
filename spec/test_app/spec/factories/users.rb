FactoryGirl.define do
  factory :user do
    email "user@test.com"
    password "user"

    factory :admin_user do
      email "admin@test.com"
      password "user"
    end
  end
end
