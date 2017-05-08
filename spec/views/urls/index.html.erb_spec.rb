require 'rails_helper'

RSpec.describe "urls/index.html.erb", type: :feature do
  # pending "add some examples to (or delete) #{__FILE__}"
  it "has a link to the #new template" do
    visit "/urls"
    click_link("New URL")
    expect(page.current_path).to eq("/urls/new")
  end
end
