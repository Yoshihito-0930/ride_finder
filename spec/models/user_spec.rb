require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'バリデーションチェック' do
    it '設定したすべてのバリデーションが機能しているか' do
      user = User.new(name: "test", email: "user@example.com", uid: "test", provider: "hogehoge")
      expect(user).to be_valid
      expect(user.errors).to be_empty
    end

    it 'nameが無い場合にバリデーションが機能してinvalidになるか' do
      user_without_name = User.new(name: "", email: "user@example.com", uid: "test", provider: "hogehoge")
      expect(user_without_name).to be_invalid
      expect(user_without_name.errors[:name]).to eq ["を入力してください"]
    end

    it 'emailが無い場合にバリデーションが機能してinvalidになるか' do
      user_without_email = User.new(name: "test", email: "", uid: "test", provider: "hogehoge")
      expect(user_without_email).to be_invalid
      expect(user_without_email.errors[:email]).to eq ["を入力してください"]
    end

    it 'uidが無い場合にバリデーションが機能してinvalidになるか' do
      user_without_uid = User.new(name: "test", email: "user@example.com", uid: "", provider: "hogehoge")
      expect(user_without_uid).to be_invalid
      expect(user_without_uid.errors[:uid]).to eq ["を入力してください"]
    end

    it 'providerが無い場合にバリデーションが機能してinvalidになるか' do
      user_without_provider = User.new(name: "test", email: "user@example.com", uid: "test", provider: "")
      expect(user_without_provider).to be_invalid
      expect(user_without_provider.errors[:provider]).to eq ["を入力してください"]
    end

    it 'providerとuidが被った場合にuniqueのバリデーションが機能してinvalidになるか' do
      user = User.create(name: "test", email: "user@example.com", uid: "test", provider: "hogehoge")
      invalid_user = User.new(name: "test", email: "user@example.com", uid: "test", provider: "hogehoge")
      expect(invalid_user).to be_invalid
      expect(invalid_user.errors[:uid]).to include("uidとproviderの組み合わせは既に存在します")
      expect(invalid_user.errors[:provider]).to include("providerとuidの組み合わせは既に存在します")
    end

    it 'providerが別々でuidが被った場合にバリデーションエラーが起きないか' do
      user = User.create(name: "test", email: "user@example.com", uid: "test", provider: "hogehoge")
      invalid_user = User.new(name: "test", email: "user@example.com", uid: "test", provider: "mogemoge")
      expect(invalid_user).to be_valid
      expect(invalid_user.errors[:uid]).to be_empty
      expect(invalid_user.errors[:provider]).to be_empty
    end

    it 'providerが同じでuidが別々の場合にバリデーションエラーが起きないか' do
      user = User.create(name: "test", email: "user@example.com", uid: "test", provider: "hogehoge")
      invalid_user = User.new(name: "test", email: "user@example.com", uid: "moge", provider: "hogehoge")
      expect(invalid_user).to be_valid
      expect(invalid_user.errors[:uid]).to be_empty
      expect(invalid_user.errors[:provider]).to be_empty
    end
  end
end
