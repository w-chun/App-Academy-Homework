require 'rails_helper'

RSpec.describe User, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"


  describe User do
    subject(:user) do
      FactoryGirl.build(:user, email: "w@gmail.com", password: "password")
    end

    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:password_digest) }
    it { should validate_length_of(:password).is_at_least(6) }

    describe '#is_password?' do
      it "verifies a password is correct" do
        expect(user.is_password?('password')).to be(true)
      end
    end

    decribe '#reset_session_token' do
      it "sets a new session token on the user" do
        user.valid?
        old_session_token = user.session_token
        user.reset_session_token!
        expect(user.session_token).to_not eq(old_session_token)
      end
    end

    describe '.find_by_credentials' do
      before { user.save! }
      it "returns user given good credentials" do
        expect(User.find_by_credentials("w@gmail.com", "password")).to eq(user)
      end
    end
  end
end 
