FactoryGirl.define do
  factory :recipe do
    sequence(:name) { |n| "Natural#{n}" }
    time_ready "11 minutes"
    quantity "6 things"
    flavor "natural"
    ingredients "Panela Namoy and something else"
    instructions "Mix, cool and serve."
    image "Image"
  end
end
