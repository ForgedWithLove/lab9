# frozen_string_literal: true

require 'rails_helper'
require 'selenium-webdriver'
require 'capybara/rails'

feature 'User enters correct data' do
  scenario 'Entering 1000' do
    @driver = Selenium::WebDriver.for :firefox
    @url = 'http://localhost:3000'
    @driver.get(@url)
    input_tag = @driver.find_element(:name, 'v1')
    input_tag.click
    input_tag.send_keys '1000'
    @driver.find_element(:name, 'commit').click
    sleep 2
    expect(@driver.find_element(:css, 'tbody:nth-child(2) td:nth-child(1)').text).to eq('220')
    expect(@driver.find_element(:css, 'tbody:nth-child(2) td:nth-child(2)').text).to eq('284')
    @driver.close()
  end
  scenario 'Entering 10000' do
    @driver = Selenium::WebDriver.for :firefox
    @url = 'http://localhost:3000'
    @driver.get(@url)
    input_tag = @driver.find_element(:name, 'v1')
    input_tag.click
    input_tag.send_keys '10000'
    @driver.find_element(:name, 'commit').click
    sleep 7
    expect(@driver.find_element(:css, 'tbody:nth-child(2) td:nth-child(1)').text).to eq('220')
    expect(@driver.find_element(:css, 'tbody:nth-child(2) td:nth-child(2)').text).to eq('284')
    expect(@driver.find_element(:css, 'tbody:nth-child(3) td:nth-child(1)').text).to eq('1184')
    expect(@driver.find_element(:css, 'tbody:nth-child(3) td:nth-child(2)').text).to eq('1210')
    expect(@driver.find_element(:css, 'tbody:nth-child(4) td:nth-child(1)').text).to eq('2620')
    expect(@driver.find_element(:css, 'tbody:nth-child(4) td:nth-child(2)').text).to eq('2924')
    expect(@driver.find_element(:css, 'tbody:nth-child(5) td:nth-child(1)').text).to eq('5020')
    expect(@driver.find_element(:css, 'tbody:nth-child(5) td:nth-child(2)').text).to eq('5564')
    expect(@driver.find_element(:css, 'tbody:nth-child(6) td:nth-child(1)').text).to eq('6232')
    expect(@driver.find_element(:css, 'tbody:nth-child(6) td:nth-child(2)').text).to eq('6368')
    @driver.close()
  end
end
feature 'User enters incorrect data' do
  scenario 'Entering string' do
    @driver = Selenium::WebDriver.for :firefox
    @url = 'http://localhost:3000'
    @driver.get(@url)
    input_tag = @driver.find_element(:name, 'v1')
    input_tag.click
    input_tag.send_keys 'sgh7u'
    @driver.find_element(:name, 'commit').click
    sleep 2
    expect(@driver.find_element(id: 'error').text).to eq('Пожалуйста, введите натуральное число.')
    @driver.close()
  end
end
