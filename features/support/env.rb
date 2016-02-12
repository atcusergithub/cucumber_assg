require 'selenium-webdriver'
require 'YAML'

Before do
  @driver = Selenium::WebDriver.for :firefox
  @driver.manage.timeouts.implicit_wait = 10 # seconds
  @driver.manage.window.maximize
end

After do
  @driver.quit
end