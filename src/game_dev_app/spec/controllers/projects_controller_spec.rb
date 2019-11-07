require 'rails_helper'

RSpec.describe ProjectsController, type: :controller do

  describe "view new project form" do

    before(:each) do
      @project_owner = Member.create(
        email: "zach@email.com",
        password: "asdfasdf",
        password_confirmation: "asdfasdf",
      )
    end

    it 'logs in and views new project template' do
        sign_in @project_owner
        get :new
        expect(response).to render_template(:new)
    end

    it 'creates and renders project with a valid role' do
      @project = Project.create(
        title: "Call of Judy",
        description: "The best FPS ever!",
        duration: "6 months",
        budget: 50000,
        owner: @project_owner,
      )
      @project_role = ProjectRole.create(
        expertise: Expertise.where(title: "Programmer"),
        project: @project,
        description: "I need a Programmer to work on Call of Duty.",
      )
      @project_role = ProjectRole.create(
        expertise: Expertise.where(title: "Programmer"),
        project: @project,
        description: "I need a Programmer to work on Call of Duty.",
      )
      get :show, params: { id: @project }
      expect(response).to render_template(:show)
    end

  end

end
