# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  email      :string(255)
#  provider   :string(255)
#  uid        :string(255)
#  created_at :datetime
#  updated_at :datetime
#

require 'rails_helper'

describe User do

  describe "Validations" do
    it 'should validate presence of :email' do
      expect(subject).to validate_presence_of :email
    end

    it { expect(subject).to validate_presence_of :name }
    it { expect(subject).to validate_presence_of :email }
    it { expect(subject).to validate_presence_of :provider }
    it { expect(subject).to validate_presence_of :uid }
  end

  describe ".from_omniauth" do
    context "New auth info" do
      it "loads user data from omni auth" do
        auth_info = OmniAuth::AuthHash.new({
          provider: 'facebook',
          uid: 'some random uid',
          info: {
            email: 'pheku.raja@test.com',
            name: 'pheku raja',
            verified: true
          }
        })

        expect do
          User.from_omniauth(auth_info)
        end.to change(User, :count).by 1
      end
    end

    context "User already present with given auth info" do
      it "does not load the user data" do
        provider = 'facebook'
        uid      = 'some random uid'

        User.create(provider: provider, uid: uid)
        auth_info = {
          provider: provider,
          uid: uid,
          info: {
            email: 'pheku.raja@test.com',
            name: 'pheku raja',
            verified: true
          }
        }

        expect do
          User.from_omniauth(auth_info)
        end.to change(User, :count).by 0
      end
    end
  end
end
