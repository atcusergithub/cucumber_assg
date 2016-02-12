class Select_flight
  def initialize(driver)
    @driver=driver
  end

  def yaml_select_details(r_typ)
      @recd_data = YAML.load(File.read("C:/Users/Shravan/RubymineProjects/cucumber_assg/features/data/data.yaml"))
      select_depart_flight(@recd_data["#{r_typ}"]["selectdepart"])
      select_return_flight(@recd_data["#{r_typ}"]["selectreturn"])
  end

  def select_depart_flight(select_depart)
    radio_btn2 = @driver.find_element(:css,"input[value='#{select_depart}'][name='outFlight']")
    radio_btn2.click
  end

  def select_return_flight(select_return)
    radio_btn3 = @driver.find_element(:css,"input[value='#{select_return}'][name='inFlight']")
    radio_btn3.click
  end

  def select_cont_reserve
    cont2 = @driver.find_element(:name,"reserveFlights")
    cont2.click
  end

  def Verify_Select_Flight_Page
    wait = Selenium::WebDriver::Wait.new(:timeout => 10)
    wait.until {@driver.find_element(:name,"reserveFlights")}
    if @driver.title == "Select a Flight: Mercury Tours"
      puts @driver.title
      puts "Test Pass"
    else
      puts "Test Fail"
    end
  end

end