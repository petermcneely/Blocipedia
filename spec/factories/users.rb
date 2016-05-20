FactoryGirl.define do
  factory :user do
    email RandomData.random_email
    password "helloworld"
  end
end
