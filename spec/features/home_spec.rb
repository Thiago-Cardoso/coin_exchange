require 'rails_helper'

RSpec.describe "Exchange Currency Process", :type => :feature do
  it "exchange value" do
    visit '/' #visit of page
    within("#exchange_form") do
      select('EUR', from: 'currency') #select curreny
      select('USD', from: 'currency_destination') #select destination
      fill_in 'quantity', with: '10'
    end
    click_button 'CONVERTER' #button for CONVERTER coin

    # save_and_open_page (print screen)
    expect(page).to have_content("value")
  end
end
