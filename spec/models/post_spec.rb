require 'rails_helper'

RSpec.describe Post, type: :model do
  describe "#create" do
    let(:image_path) { File.join(Rails.root, 'spec/fixtures/IMG_0278.png') }
    let(:image) { Rack::Test::UploadedFile.new(image_path) }
    context 'postを保存できる場合' do
      it "title,content,imageが存在すれば投稿できること" do
        post = create(:post)
        post.valid?
        expect(post).to be_valid
      end
    end

    context 'postを保存できない場合' do
      it "titleが存在しないと投稿できないこと" do
        user = create(:user)
        post = user.posts.build(
          title: nil,
          content: "テストです",
          image: image
        )
        post.valid?
        expect(post.errors[:title]).to include("can't be blank")
      end

      it "contentが存在しないと投稿できないこと" do
        user = create(:user)
        post = user.posts.build(
          title: "test",
          content: nil,
          image: image
        )
        post.valid?
        expect(post.errors[:content]).to include("can't be blank")
      end

      it "imageが存在しないと投稿できないこと" do
        user = create(:user)
        post = user.posts.build(
          title: "test",
          content: "テストです",
          image: nil
        )
        post.valid?
        expect(post.errors[:image]).to include("can't be blank")
      end
    end
  end    
end
