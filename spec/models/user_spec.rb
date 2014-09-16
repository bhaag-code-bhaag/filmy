require "rails_helper"

describe User do

  describe "Validations" do
    it { expect(subject).to validate_presence_of :name }
    it { expect(subject).to validate_presence_of :email }
    it { expect(subject).to validate_presence_of :provider }
    it { expect(subject).to validate_presence_of :uid }
  end

  describe ".from_omniauth" do
    let(:auth_info) do
      Hashie::Mash.new(
        provider: "facebook",
        uid: "some random uid",
        info: {
          email: "pheku.raja@test.com",
          name: "pheku raja",
          verified: true
        }
      )
    end

    context "New auth info" do
      it "loads user data from omni auth" do
        expect do
          User.from_omniauth(auth_info)
        end.to change(User, :count).by 1
      end

      it "returns created user" do
        expect(User.from_omniauth(auth_info)).to eq(User.last)
      end
    end

    context "User already present with given auth info" do
      it "does not load the user data" do
        User.create(provider: "facebook", uid: "some random uid", name: "somename", email: "some@test.com")

        expect do
          User.from_omniauth(auth_info)
        end.to change(User, :count).by 0
      end

      it "returns existing user" do
        user = User.create(provider: "facebook", uid: "some random uid", name: "somename", email: "some@test.com")

        expect(User.from_omniauth(auth_info)).to eq user
      end
    end
  end
end
