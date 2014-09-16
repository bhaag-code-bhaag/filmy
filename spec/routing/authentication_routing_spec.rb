require "rails_helper"

describe "routes for Authentication" do
  it "routes /users/logout to the sessions controller" do
    expect(get: "/users/logout")
    .to route_to("sessions#destroy")
  end

  it "routes /auth/facebook/callback to sessions controller" do
    expect(get: "/auth/facebook/callback")
      .to route_to(controller: "sessions", action: "create", provider: "facebook")
  end

  it "routes /sessions/index to sessions controller" do
    expect(get: "/").to route_to("sessions#index")
  end
end
