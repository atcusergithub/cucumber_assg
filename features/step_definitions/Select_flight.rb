And(/^I select the flight details from (.*)$/) do |recd|
  puts "Step4 - #{recd}"
  select_flight_details = Select_flight.new(@driver)
  select_flight_details.yaml_select_details(recd)
  select_flight_details.select_cont_reserve
  verify_select_details = Payment_details.new(@driver)
  verify_select_details.Verify_Book_Flight_Page
end