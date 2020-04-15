FactoryBot.define do
  factory :user do
    nickname {"nori"}
    email {"nori@gamil.com"}
    password {"norinori"}
    password_confirmation {"norinori"}
    avatar Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec/fixtures/IMG_0278.png'))  
  end
end
