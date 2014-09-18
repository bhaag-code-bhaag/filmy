Feature: Add movie
  In order show case movie
  As a logged in user
  I want to be able to save movie information

    Background:
      Given I am logged in

    @omniauth_test
    Scenario: User should be able to add movie info
      When I visit movie creation page
      And fill in movie details
      Then I should see "Successfully created movie" message

    @omniauth_test
    Scenario: User should see failure message when given no movie info
      When I visit movie creation page
      And fill in invalid movie details
      Then I should see "can't be blank" message