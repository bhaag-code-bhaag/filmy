require "rails_helper"

describe "routes for Authentication" do
  it "routes /movies/new GET to the movies controller new action" do
    expect(get: "/movies/new")
    .to route_to("movies#new")
  end

  it "routes /movies POST to the movies controller create action" do
    expect(post: "/movies")
    .to route_to("movies#create")
  end
end
