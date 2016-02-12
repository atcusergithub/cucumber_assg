Given(/^I open the website in a browser$/) do
  puts "Step1"
  @driver.navigate.to "http://newtours.demoaut.com/"
end

When(/^I login with login details from (.*)$/) do |recd|
  puts "Step2 - #{recd}"
  login_details = Login.new(@driver)
  login_details.yaml_login(recd)
  verify_login = Form_details.new(@driver)
  verify_login.Verify_Find_Flight_Page
end
