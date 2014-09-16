require 'rails_helper'

feature "User Enters Valid Name" do
  scenario "user enters valid name" do
    visit '/'
    fill_in "name", with: "TkG Mars"
    click_on "Track"
    expect(page).to have_content("Gold Tracking Information for TkG Mars")
  end
end
