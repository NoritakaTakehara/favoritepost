require 'rails_helper'

RSpec.feature "Posts", type: :feature do
  scenario 'ユーザーが新しいpostを投稿する' do
    user = FactoryBot.create(:user)


    visit new_user_session_path
    fill_in 'user_email', with: user.email
    fill_in 'user_password', with: user.password
    click_button "ログイン"
    expect(current_path).to eq root_path


    expect {
      click_link('投稿')
      fill_in 'title', with: '初めての投稿'
      attach_file "post[image]", "spec/fixtures/IMG_0278.png"
      fill_in 'content', with: '猫です'
      click_button('投稿する')
    }.to change(Post, :count).by(1)
  end
end
