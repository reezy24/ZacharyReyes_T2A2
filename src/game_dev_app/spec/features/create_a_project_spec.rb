require 'rails_helper'

describe 'creating a project' do
    it 'fills in project details and details of the first role and then renders' do
        
        visit '/projects/new'

        # fill project details
        fill_in 'Title', with: 'Call of Duty'
        fill_in 'Description', with: 'The best FPS ever!'
        fill_in 'Duration', with: '6 months'
        fill_in 'Budget', with: '$50000'

        # add images
        attach_file 'Images', 'app/assets/images/local/cod.jpg'

        # add role
        # select "Programmer", from: "Expertise"
        # choose 'Blender'
        # choose 'Cinema3D'
        fill_in 'Role description', with: 'I need an Animator.'
        click_button 'Add Role'

        click_button 'Post Project'

        # expectations
        expect(page).to have_content('Call of Duty')
        expect(page).to have_content('The best FPS ever!')
        expect(page).to have_content('6 months')
        expect(page).to have_content('$50000')
        # missing: expect image
        expect(page).to have_content('Animator')
        expect(page).to have_content('Blender')
        expect(page).to have_content('Cinema3D')
        expect(page).to have_content('I need an Animator.')

    end
end