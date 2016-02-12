And(/^I log out$/) do
  puts "Step7 - logout"
  logout_details = Logout.new(@driver)
  logout_details.select_logout
  logout_details.Verify_logout
end