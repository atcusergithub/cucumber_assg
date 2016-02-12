class Login
  def initialize(driver)
    @driver=driver
  end

  def yaml_login(r_typ)
    @recd_data = YAML.load(File.read("C:/Users/Shravan/RubymineProjects/cucumber_assg/features/data/data.yaml"))
    # @recd_data =YAML.load(File.read("C:\Users\Shravan\RubymineProjects\cucumber\features\data\data.yaml"))
    @driver.find_element(:name,"userName").send_keys(@recd_data["#{r_typ}"]["username"])
    @driver.find_element(:name,"password").send_keys(@recd_data["#{r_typ}"]["password"])
    @driver.find_element(:name,"login").submit
  end
end