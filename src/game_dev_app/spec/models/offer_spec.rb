require 'rails_helper'

RSpec.describe Offer, type: :model do
  it "successfully creates an offer with a sender and receiver" do
    @sender = Member.create(first_name: "Zach", last_name: "Reyes", about_me: "I like to code.")
    @receiver = Member.create(first_name: "Reez", last_name: "Reyes", about_me: "I also like to code.")
    @project = Project.create(
      title: "Call of Duty",
      description: "The best FPS ever!",
      duration: "6 months",
      budget: 50000,
    )
    @offer = Offer.create(
      project_id: @project.id, 
      sender_id: @sender.id, 
      receiver_id: @receiver.id,
      response: nil,
      description: "Hi Reez, would love for you to come work on Call of Duty."
    )
    expect(@offer.project_id).to eq(@project.id)
    expect(@offer.sender_id).to eq(@sender.id)
    expect(@offer.receiver_id).to eq(@receiver.id)
    expect(@offer.response).to eq(nil)
    expect(@offer.description).to eq("Hi Reez, would love for you to come work on Call of Duty.")
  end
end
