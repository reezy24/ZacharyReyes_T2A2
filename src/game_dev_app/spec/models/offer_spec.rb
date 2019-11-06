require 'rails_helper'

RSpec.describe Offer, type: :model do
  it "successfully creates an offer with a sender and receiver" do
    Member.create(first_name: "Zach", last_name: "Reyes", about_me: "I like to code.")
    Member.create(first_name: "Reez", last_name: "Reyes", about_me: "I also like to code.")
    Project.create(
      title: "Call of Duty",
      description: "The best FPS ever!",
      duration: "6 months",
      budget: 50000,
      owner_id: Member.first.id,
    )
    Offer.create(
      project_id: Project.last.id, 
      sender_id: Project.last.owner_id, 
      receiver_id: Member.last.id,
      response: nil,
      description: "Hi Reez, would love for you to come work on Call of Duty."
    )
    expect(Offer.last.project_id).to eq(Project.last.id)
    expect(Offer.last.sender_id).to eq(Project.last.owner_id)
    expect(Offer.last.receiver_id).to eq(Member.last.id)
    expect(Offer.last.response).to eq(nil)
    expect(Offer.last.description).to eq("Hi Reez, would love for you to come work on Call of Duty.")
  end
  it "attempts to send an offer with invalid params" do
    Member.create(first_name: "Zach", last_name: "Reyes", about_me: "I like to code.")
    Member.create(first_name: "Reez", last_name: "Reyes", about_me: "I also like to code.")
    Project.create(
      title: "Call of Duty",
      description: "The best FPS ever!",
      duration: "6 months",
      budget: 50000,
      owner_id: Member.first.id,
    )
    @offer = Offer.create(
      project_id: Project.last.id, 
      sender_id: Project.last.owner_id, 
      receiver_id: Member.last.id,
      response: nil,
      description: nil,
    )
    expect(@offer.project_id).to eq(Project.last.id)
    expect(@offer.sender_id).to eq(Project.last.owner_id)
    expect(@offer.receiver_id).to eq(Member.last.id)
    expect(@offer.response).to eq(nil)
    expect(@offer.description).to eq(nil)
    expect(Offer.last).to eq(nil)
  end
end
