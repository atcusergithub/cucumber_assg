Feature: Filling a Flight Form - Login, Filling Form, Flight Confirmation, Logout

  Scenario Outline: Validate the user successfully logged, filled the form, confirmed flight and logged out
      Given I open the website in a browser
      When I login with login details from <record>
      And I fill the form details from <record>
      And I select the flight details from <record>
      And I fill payment details from <record>
      Then Flight Confirmation Page is displayed for <record>
      And I log out
    Examples:
    |record|
    |record1|
    |record2|
    |record3|