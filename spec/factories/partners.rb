FactoryGirl.define do
  factory :partner do
    name "Namoy"
    country "Colombia"
    city "Bogota"
    instagram "https://www.instagram.com/namoy_realfoods"
    facebook "https://www.facebook.com/namoynatural"
    website "www.namoy.co"
    logo { Rack::Test::UploadedFile.new(File.join(Rails.root, '/spec/support/ex_upload_file/logo_blanco_letras.png')) }

    factory :invalid_partner do
      name nil
    end
  end
end
