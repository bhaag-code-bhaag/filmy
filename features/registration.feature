Feature: Registration
  In order to get access to protected sections of the site
  As a user
  I want to be able to register

    Background:
      Given I am not logged in

    @omniauth_test
    Scenario: User signs up with valid info
      When I sign up with valid user information
      Then I should see a successful registration message