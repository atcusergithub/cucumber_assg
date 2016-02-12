And(/^I fill the form details from (.*)$/) do |recd|
  puts "Step3 - #{recd}"
  fill_form_details = Form_details.new(@driver)
  fill_form_details.yaml_form_details(recd)
  fill_form_details.select_cont_find
  verify_form_details = Select_flight.new(@driver)
  verify_form_details.Verify_Select_Flight_Page
end