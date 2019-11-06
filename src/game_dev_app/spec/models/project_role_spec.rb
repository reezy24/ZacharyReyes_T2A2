require 'rails_helper'

RSpec.describe ProjectRole, type: :model do
  it "successfully adds a role to a project" do
    @project = Project.create(
      title: "Call of Duty",
      description: "The best FPS ever!",
      duration: "6 months",
      budget: 50000,
    )
    @expertise = Expertise.create(
      title: "Programmer"
    )
    @project_role = ProjectRole.create(
      expertise_id: @expertise.id,
      project_id: @project.id,
      description: "I need a Programmer to work on Call of Duty.",
    )
    expect(@project_role.expertise_id).to  eq(@expertise.id)
    expect(@project_role.project_id).to  eq(@project.id)
    expect(@project_role.description).to  eq("I need a Programmer to work on Call of Duty.")
  end
end
