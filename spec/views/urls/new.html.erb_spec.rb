require 'rails_helper'

RSpec.describe "urls/new.html.erb", type: :feature do
  it "will redirect to urls#index when submitting a valid short url" do
    visit "/urls/new"
    fill_in('Long url', with: 'http://www.example.com')
    click_button 'Create Url'
    expect(page.current_path).to eq("/urls")
  end

  it "will rerender when submitting an invalid short url" do
    visit "/urls/new"
    fill_in('Long url', with: 'not_a_valid_url')
    click_button 'Create Url'
    expect(page.has_css?(".new_url")).to be(true)
  end
end
