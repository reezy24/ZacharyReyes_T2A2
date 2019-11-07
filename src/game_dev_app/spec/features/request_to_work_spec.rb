require 'rails_helper'

describe "a member requests to work on a project" do
    # navigate to a project page
    visit "/projects/1"
    # click on apply button
    click_button "Apply" # what if there's more than one apply button?
    # overlay opens
    # should autofill position
    fill_in 'Cover Letter', with: "Hi! I'd like to work with you."
    # can submit
    # appears in member's outgoing
    # appears in project owner's inbound
end
