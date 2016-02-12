class Flight_confirm
  def initialize(driver)
    @driver=driver
  end

  def verify_confirm_details
    wait = Selenium::WebDriver::Wait.new(:timeout => 30)
    wait.until {@driver.find_element(:xpath,"//font[contains(text(),'Flight')]")}
    msg = @driver.find_element(:xpath,"//font[contains(text(),'Flight')]").text()
    if msg.include? 'Flight Confirmation '
       puts msg
      puts "Test Pass"
    else
      puts "Test Fail"
    end
  end

  def Flight_confirm_page(r_typ)
  wait = Selenium::WebDriver::Wait.new(:timeout => 10)
  wait.until {@driver.title.start_with? "Flight " }
  if @driver.title == "Flight Confirmation: Mercury Tours"
    puts @driver.title
    puts "Test Pass"
    @driver.save_screenshot("#{r_typ}.png")
  else
    puts "Test Fail"
    @driver.save_screenshot("#{r_typ}.png")
  end
  end
end