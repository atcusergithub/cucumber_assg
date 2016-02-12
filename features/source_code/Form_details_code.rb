class Form_details
  def initialize(driver)
    @driver=driver
  end

  def yaml_form_details(r_typ)
    @recd_data = YAML.load(File.read("C:/Users/Shravan/RubymineProjects/cucumber_assg/features/data/data.yaml"))
    select_trip_type(@recd_data["#{r_typ}"]["triptype"])
    select_pass_count(@recd_data["#{r_typ}"]["passengers"])
    select_depart_from(@recd_data["#{r_typ}"]["departfrom"])
    select_depart_month(@recd_data["#{r_typ}"]["departmonth"])
    select_depart_day(@recd_data["#{r_typ}"]["departday"])
    select_arrive_on(@recd_data["#{r_typ}"]["arriveon"])
    select_arrive_month(@recd_data["#{r_typ}"]["arrivemonth"])
    select_arrive_day(@recd_data["#{r_typ}"]["arriveday"])
    select_service_class(@recd_data["#{r_typ}"]["serviceclass"])
    select_airline_typ(@recd_data["#{r_typ}"]["airline"])
  end

  def select_trip_type(trip_type)
    radio_btn = @driver.find_element(:css,"input[value='#{trip_type}']")
    radio_btn.click
  end

  def select_pass_count(pass_count)
    select = Selenium::WebDriver::Support::Select.new(@driver.find_element(:css,"select[name=passCount]"))
    drpdown = select.select_by(:index,"#{pass_count}")
  end

  def select_depart_from(depart_from)
    select = Selenium::WebDriver::Support::Select.new(@driver.find_element(:css,"select[name=fromPort]"))
    drpdown = select.select_by(:index,"#{depart_from}")
  end

  def select_depart_month(depart_month)
    select = Selenium::WebDriver::Support::Select.new(@driver.find_element(:css,"select[name=fromMonth]"))
    drpdown = select.select_by(:index,"#{depart_month}")
  end

  def select_depart_day(depart_day)
    select = Selenium::WebDriver::Support::Select.new(@driver.find_element(:css,"select[name=fromDay]"))
    drpdown = select.select_by(:index,"#{depart_day}")
  end

  def select_arrive_on(arrive_on)
    select = Selenium::WebDriver::Support::Select.new(@driver.find_element(:css,"select[name=toPort]"))
    drpdown = select.select_by(:index,"#{arrive_on}")
  end

  def select_arrive_month(arrive_month)
    select = Selenium::WebDriver::Support::Select.new(@driver.find_element(:css,"select[name=toMonth]"))
    drpdown = select.select_by(:index,"#{arrive_month}")
  end

  def select_arrive_day(arrive_day)
    select = Selenium::WebDriver::Support::Select.new(@driver.find_element(:css,"select[name=toDay]"))
    drpdown = select.select_by(:index,"#{arrive_day}")
  end

  def select_service_class(service_class)
    radio_btn1 = @driver.find_element(:css,"input[value='#{service_class}']")
    radio_btn1.click
  end

  def select_airline_typ(airline_typ)
    select = Selenium::WebDriver::Support::Select.new(@driver.find_element(:css,"select[name=airline]"))
    drpdown = select.select_by(:index,"#{airline_typ}")
  end

  def select_cont_find
    cont1 = @driver.find_element(:name,"findFlights")
    cont1.click
  end

  def Verify_Find_Flight_Page
    wait = Selenium::WebDriver::Wait.new(:timeout => 5)
    wait.until { @driver.title.start_with? "Find " }
    if @driver.title == "Find a Flight: Mercury Tours:"
      puts @driver.title
      puts "Test Pass"
    else
      puts "Test Fail"
    end
  end

 end