require 'rails_helper'

RSpec.describe User, type: :model do

  it "nickname,email,avatar,password,password_confirmation,avatarが存在すれば登録出来ること" do
    user = build(:user)
    expect(user).to be_valid
  end

  it "nicknameがない場合は登録出来ないこと" do
    user = build(:user,nickname: nil)
    user.valid?
    expect(user.errors[:nickname]).to include("can't be blank")
  end

  it "nicknameが16文字以上の場合は登録出来ないこと" do
    user = build(:user,nickname: "aaaaaaaaaaaaaaaa")
    user.valid?
    expect(user.errors[:nickname]).to include("is too long (maximum is 15 characters)")
  end

  it "nicknameが15文字以下の場合は登録出来ること" do
    user = build(:user,nickname: "aaaaaaaaaaaaaaa")
    user.valid?
    expect(user).to be_valid
  end

  it "重複したnicknameなら無効であること" do
    create(:user, nickname: "nori")
    another_user = build(:user, nickname: "nori")
    another_user.valid?
    expect(another_user.errors[:nickname]).to include("has already been taken")
  end

  





  it "emailがない場合は登録出来ないこと" do
    user = build(:user,email: nil)
    user.valid?
    expect(user.errors[:email]).to include("can't be blank")
  end

  it "重複したemailなら無効であること" do
    create(:user, email: "nori@gmail.com")
    another_user = build(:user, email: "nori@gmail.com")
    another_user.valid?
    expect(another_user.errors[:email]).to include("has already been taken")
  end


  it "passwordがない場合は登録出来ないこと" do
    user = build(:user,password: nil)
    user.valid?
    expect(user.errors[:password]).to include("can't be blank")
  end

  it "passwordが存在してもpassword_confirmationがない場合は登録出来ないこと" do
    user = build(:user,password_confirmation: "")
    user.valid?
    expect(user.errors[:password_confirmation]).to include("doesn't match Password")
  end

  it "passwordが6文字以上であれば登録出来ること" do
    user = build(:user,password: "aaaaaa",password_confirmation: "aaaaaa")
    user.valid?
    expect(user).to be_valid
  end

  it "passwordが5文字以下であれば登録出来ないこと" do
    user = build(:user,password: "aaaaa",password_confirmation: "aaaaa")
    user.valid?
    expect(user.errors[:password]).to include("is too short (minimum is 6 characters)")
  end

  it "avatarがない場合は登録出来ないこと" do
    user = build(:user,avatar: nil)
    user.valid?
    expect(user.errors[:avatar]).to include("can't be blank")
  end

end
