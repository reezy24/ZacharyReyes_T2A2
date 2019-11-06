require 'rails-helper'

describe "it creates the member's profile" do

    visit "/dashboard/profile/update"

    # member details
    fill_in "First Name",	with: "Zachary" 
    fill_in "Last Name",	with: "Reyes" 
    fill_in "About Me",	with: "I like to code."
    attach_file 'Upload', 'app/assets/images/local/cod.jpg'
    
    # portfolio section
    select "Programmer", from: "Expertise"
    fill_in "Description",	with: "I'm a good programmer."
    attach_file 'Upload', 'app/assets/images/local/cod.jpg'
    click_button "Add Entry"

    click_button "Save Changes"

end
