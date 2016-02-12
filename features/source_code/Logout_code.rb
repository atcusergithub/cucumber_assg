class Logout
  def initialize(driver)
    @driver=driver
  end

  def select_logout
    @driver.find_element(:link_text,"SIGN-OFF").click
  end

  def Verify_logout
    wait = Selenium::WebDriver::Wait.new(:timeout => 10)
    wait.until {@driver.title.start_with? "Sign-on" }
    if @driver.title == "Sign-on: Mercury Tours"
      puts "SIGNED OFF"
    else
      puts "NOT SIGNED OFF"
    end
  end

end