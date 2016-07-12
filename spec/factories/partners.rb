FactoryGirl.define do
  factory :partner do
    name "Namoy"
    country "Colombia"
    city "Bogota"
    logo "Image"
    instagram "https://www.instagram.com/namoy_realfoods"
    facebook "https://www.facebook.com/namoynatural"
    website "www.namoy.co"

    factory :invalid_partner do
      name nil
    end
  end
end
