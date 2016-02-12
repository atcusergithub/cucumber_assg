class Payment_details
  def initialize(driver)
    @driver=driver
  end

  def yaml_payment_details(r_typ)
    @recd_data = YAML.load(File.read("C:/Users/Shravan/RubymineProjects/cucumber_assg/features/data/data.yaml"))
    pass_count = @recd_data["#{r_typ}"]["passengers"]
    @no_of_pass = "#{pass_count}".to_i + 1
    select_pass0(@recd_data["#{r_typ}"]["pass0_fn"],@recd_data["#{r_typ}"]["pass0_ln"],@recd_data["#{r_typ}"]["pass0_meal"])
    case (@no_of_pass)
      when 2
        select_pass1(@recd_data["#{r_typ}"]["pass1_fn"],@recd_data["#{r_typ}"]["pass1_ln"],@recd_data["#{r_typ}"]["pass1_meal"])
      when 3
        select_pass1(@recd_data["#{r_typ}"]["pass1_fn"],@recd_data["#{r_typ}"]["pass1_ln"],@recd_data["#{r_typ}"]["pass1_meal"])
        select_pass2(@recd_data["#{r_typ}"]["pass2_fn"],@recd_data["#{r_typ}"]["pass2_ln"],@recd_data["#{r_typ}"]["pass2_meal"])
      when 4
        select_pass1(@recd_data["#{r_typ}"]["pass1_fn"],@recd_data["#{r_typ}"]["pass1_ln"],@recd_data["#{r_typ}"]["pass1_meal"])
        select_pass2(@recd_data["#{r_typ}"]["pass2_fn"],@recd_data["#{r_typ}"]["pass2_ln"],@recd_data["#{r_typ}"]["pass2_meal"])
        select_pass3(@recd_data["#{r_typ}"]["pass3_fn"],@recd_data["#{r_typ}"]["pass3_ln"],@recd_data["#{r_typ}"]["pass3_meal"])
      # else
        # break
    end
    select_card_type(@recd_data["#{r_typ}"]["cardtype"])
    select_card_no(@recd_data["#{r_typ}"]["cardno"])
    select_card_expmonth(@recd_data["#{r_typ}"]["cardexpmonth"])
    select_card_expyear(@recd_data["#{r_typ}"]["cardexpyear"])
    select_card_name(@recd_data["#{r_typ}"]["pass0_fn"],@recd_data["#{r_typ}"]["pass0_mn"],@recd_data["#{r_typ}"]["pass0_ln"])
    select_chk_box_btn
    select_addr_line1(@recd_data["#{r_typ}"]["addrline1"])
    select_addr_line2(@recd_data["#{r_typ}"]["addrline2"])
    select_addr_city(@recd_data["#{r_typ}"]["city"])
    select_addr_state(@recd_data["#{r_typ}"]["state"])
    select_addr_zip(@recd_data["#{r_typ}"]["zip"])
    select_addr_country(@recd_data["#{r_typ}"]["country"])
  end

  def select_pass0(firstname_pass0,lastname_pass0,meal_pass0)
    fname = @driver.find_element(:css,"input[name=passFirst0]").send_keys(firstname_pass0)
    lname = @driver.find_element(:css,"input[name=passLast0]").send_keys(lastname_pass0)
    select = Selenium::WebDriver::Support::Select.new(@driver.find_element(:css,"select[name='pass.0.meal']"))
    drpdown = select.select_by(:text,meal_pass0)
  end

  def select_pass1(firstname_pass1,lastname_pass1,meal_pass1)
    fname1 = @driver.find_element(:css,"input[name=passFirst1]").send_keys(firstname_pass1)
    lname1 = @driver.find_element(:css,"input[name=passLast1]").send_keys(lastname_pass1)
    select = Selenium::WebDriver::Support::Select.new(@driver.find_element(:css,"select[name='pass.1.meal']"))
    drpdown = select.select_by(:text,meal_pass1)
  end

  def select_pass2(firstname_pass2,lastname_pass2,meal_pass2)
    fname2 = @driver.find_element(:css,"input[name=passFirst2]").send_keys(firstname_pass2)
    lname2 = @driver.find_element(:css,"input[name=passLast2]").send_keys(lastname_pass2)
    select = Selenium::WebDriver::Support::Select.new(@driver.find_element(:css,"select[name='pass.2.meal']"))
    drpdown = select.select_by(:text,meal_pass2)
  end

  def select_pass3(firstname_pass3,lastname_pass3,meal_pass3)
    fname3 = @driver.find_element(:css,"input[name=passFirst3]").send_keys(firstname_pass3)
    lname3 = @driver.find_element(:css,"input[name=passLast3]").send_keys(lastname_pass3)
    select = Selenium::WebDriver::Support::Select.new(@driver.find_element(:css,"select[name='pass.3.meal']"))
    drpdown = select.select_by(:text,meal_pass3)
  end

  def select_card_type(card_type)
    select = Selenium::WebDriver::Support::Select.new(@driver.find_element(:css,"select[name='creditCard']"))
    drpdown = select.select_by(:text,card_type)
  end

  def select_card_no(card_no)
    credit_num = @driver.find_element(:css,"input[name=creditnumber]").send_keys(card_no)
  end

  def select_card_expmonth(card_expmonth)
    select = Selenium::WebDriver::Support::Select.new(@driver.find_element(:css,"select[name='cc_exp_dt_mn']"))
    drpdown = select.select_by(:text,card_expmonth)
  end

  def select_card_expyear(card_expyear)
    select = Selenium::WebDriver::Support::Select.new(@driver.find_element(:css,"select[name='cc_exp_dt_yr']"))
    drpdown = select.select_by(:text,card_expyear)
  end

  def select_card_name(firstname_pass0,middlename_pass0,lastname_pass0)
    credit_fname = @driver.find_element(:css,"input[name=cc_frst_name]").send_keys(firstname_pass0)
    credit_mname = @driver.find_element(:css,"input[name=cc_mid_name]").send_keys(middlename_pass0)
    credit_lname = @driver.find_element(:css,"input[name=cc_last_name]").send_keys(lastname_pass0)
  end

  def select_chk_box_btn
    chk_box = @driver.find_elements(:name,"ticketLess")
    chk_box.each do |i|
      i.click
    end
  end

  def select_addr_line1(addr_line1)
    addr_l1 = @driver.find_element(:css,"input[name=billAddress1]")
    addr_l1.clear
    addr_l1.send_keys(addr_line1)
  end

  def select_addr_line2(addr_line2)
    addr_l2 = @driver.find_element(:css,"input[name=billAddress2]").send_keys(addr_line2)
  end

  def select_addr_city(addr_city)
    city = @driver.find_element(:css,"input[name=billCity]").clear
    city = @driver.find_element(:css,"input[name=billCity]").send_keys(addr_city)
  end

  def select_addr_state(addr_state)
    state = @driver.find_element(:css,"input[name=billState]").clear
    state = @driver.find_element(:css,"input[name=billState]").send_keys(addr_state)
  end

  def select_addr_zip(addr_zip)
    zip_cd = @driver.find_element(:css,"input[name=billZip]").clear
    zip_cd = @driver.find_element(:css,"input[name=billZip]").send_keys(addr_zip)
  end

  def select_addr_country(addr_country)
    select = Selenium::WebDriver::Support::Select.new(@driver.find_element(:css,"select[name='billCountry']"))
    drpdown = select.select_by(:text,addr_country)
  end

  def select_cont_buy
    cont2 = @driver.find_element(:name,"buyFlights")
    cont2.click
  end

  def Verify_Book_Flight_Page
    wait = Selenium::WebDriver::Wait.new(:timeout => 10)
    wait.until {@driver.find_element(:name,"buyFlights")}
    if @driver.title == "Book a Flight: Mercury Tours"
      puts @driver.title
      puts "Test Pass"
    else
      puts "Test Fail"
    end
end

end