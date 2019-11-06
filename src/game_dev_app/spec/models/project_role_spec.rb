require 'rails_helper'

RSpec.describe ProjectRole, type: :model do
  it "successfully adds a role to a project" do
    @member = Member.create(
      first_name: "Zach", 
      last_name: "Reyes",
      about_me: "I like to code."
    )
    expect(Member.last).to eq(@member)
    @project = Project.create(
      title: "Call of Duty",
      description: "The best FPS ever!",
      duration: "6 months",
      budget: 50000,
      owner_id: Member.last.id,
    )
    expect(Project.last).to eq(@project)
    @expertise = Expertise.create(
      title: "Programmer"
    )
    expect(Expertise.last).to eq(@expertise)
    @project_role = ProjectRole.create(
      expertise: Expertise.last,
      project_id: Project.last.id,
      description: "I need a Programmer to work on Call of Duty.",
    )
    expect(ProjectRole.last).to eq(@project_role)
    expect(ProjectRole.last.expertise_id).to  eq(Expertise.last.id)
    expect(ProjectRole.last.project_id).to  eq(Project.last.id)
    expect(ProjectRole.last.description).to  eq("I need a Programmer to work on Call of Duty.")
  end
  it "attempts to create add a role with invalid params" do
    @member = Member.create(
      first_name: "Zach", 
      last_name: "Reyes",
      about_me: "I like to code."
    )
    expect(Member.last).to eq(@member)
    @project = Project.create(
      title: "Call of Duty",
      description: "The best FPS ever!",
      duration: "6 months",
      budget: 50000,
      owner_id: Member.last.id,
    )
    expect(Project.last).to eq(@project)
    @expertise = Expertise.create(
      title: "Programmer"
    )
    expect(Expertise.last).to eq(@expertise)
    @project_role = ProjectRole.create(
      expertise: @expertise,
      project: @project,
      description: nil,
    )
    expect(ProjectRole.last).to eq(nil)
    expect(@project_role.expertise_id).to  eq(Expertise.last.id)
    expect(@project_role.project_id).to  eq(Project.last.id)
    expect(@project_role.description).to  eq(nil)
  end
end
