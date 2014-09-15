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

class User < ActiveRecord::Base
  validates :name, :email, :provider, :uid, presence: true

  def self.from_omniauth(auth)
    unless find_by_provider_and_uid(auth[:provider], auth[:uid])
      User.create({
        name: auth.info.name,
        email: auth.info.email,
        uid: auth.uid,
        provider: auth.provider
        })
    end
  end
end
