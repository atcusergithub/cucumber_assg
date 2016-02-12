And(/^I fill payment details from (.*)$/) do |recd|
  puts "Step5 - #{recd}"
  fill_payment_details = Payment_details.new(@driver)
  fill_payment_details.yaml_payment_details(recd)
  fill_payment_details.select_cont_buy
  verify_payment_details = Flight_confirm.new(@driver)
  verify_payment_details.verify_confirm_details
end