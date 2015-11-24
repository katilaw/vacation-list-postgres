require "spec_helper"

feature "user add vacation destination" do
  scenario "successfully add vacation destination" do
    visit "/vacations"
    fill_in "Destination", with: "Chicago"
    click_button "Submit"

    expect(page).to have_content "Chicago"
  end

  scenario "submit form without name" do
    visit "/vacations"
    click_button "Submit"

    expect(page).to_not have_css("li")
  end
end
