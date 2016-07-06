FactoryGirl.define do
  factory :recipe do
    time_ready "11 minutes"
    quantity "6 things"
    ingredients "Panela Namoy and something else"
    instructions "Mix, cool and serve."
    image "Image"

    factory :natural_recipe do
      sequence(:name) { |n| "Natural#{n}" }
      flavor "natural"
    end

    factory :orange_recipe do
      sequence(:name) { |n| "Naranja#{n}" }
      flavor "naranja"
    end

    factory :lemon_recipe do
      sequence(:name) { |n| "Limon#{n}" }
      flavor "limon"
    end

    factory :invalid_recipe do
      name nil
      falvor "natural"
    end
  end
end
