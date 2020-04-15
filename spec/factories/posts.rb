FactoryBot.define do
  factory :post do
    title {"初めての投稿"}
    content {"テストです"}
    image Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec/fixtures/IMG_0278.png'))
    association :user
  end
end
