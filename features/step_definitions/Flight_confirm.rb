Then(/^Flight Confirmation Page is displayed for (.*)$/) do |recd|
  puts "Step6 - #{recd}"
  flight_confirm_details = Flight_confirm.new(@driver)
  flight_confirm_details.Flight_confirm_page(recd)
end
