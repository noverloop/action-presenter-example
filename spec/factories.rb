require "factory_girl"
FactoryGirl.define do
  factory :post do
    title "Good post"
    body "A nice day"
    published true
  end
end