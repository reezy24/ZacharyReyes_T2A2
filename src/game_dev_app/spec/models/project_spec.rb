require 'rails_helper'

RSpec.describe Project, type: :model do
  it "successfully creates a project" do
    Member.create(first_name: "Zach", last_name: "Reyes", about_me: "I like to code.")
    Project.create(
      title: "Call of Judy",
      description: "The best FPS ever!",
      duration: "6 months",
      budget: 50000,
      owner_id: Member.last.id,
    )
    expect(Project.last.title).to eq("Call of Judy")
    expect(Project.last.description).to eq("The best FPS ever!")
    expect(Project.last.duration).to eq("6 months")
    expect(Project.last.budget).to eq(50000)
  end
  it "attempts to create a project with invalid params" do
    Member.create(first_name: "Zach", last_name: "Reyes", about_me: "I like to code.")
    @project = Project.create(
      title: nil,
      description: nil,
      duration: nil,
      budget: "not a budget",
      owner_id: Member.last.id,
    )
    expect(@project.title).to eq(nil)
    expect(@project.description).to eq(nil)
    expect(@project.duration).to eq(nil)
    expect(@project.budget).to eq(0)
    expect(Project.last).to eq(nil)
  end
end
