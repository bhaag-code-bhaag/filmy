require 'rails_helper'
require 'spec_helper'
RSpec.describe "routes for Authentication" do
  it "routes /users/logout to the sessions controller" do
    expect(get: '/users/logout').
      to route_to('sessions#destroy')
  end
end