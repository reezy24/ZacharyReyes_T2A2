require 'rails_helper'

RSpec.describe Member, type: :model do
  it "successfully creates a member" do
    Member.create(
      first_name: "Zach", 
      last_name: "Reyes", 
      about_me: "I like to code."
    )
    expect(Member.last.first_name).to eq("Zach")
    expect(Member.last.last_name).to eq("Reyes")
    expect(Member.last.about_me).to eq("I like to code.")
  end
  it "attempts to create a member with invalid params" do
    @member = Member.create(
      first_name: nil, 
      last_name: nil, 
      about_me: nil,
    )
    expect(@member.first_name).to eq(nil)
    expect(@member.last_name).to eq(nil)
    expect(@member.about_me).to eq(nil)
    expect(Member.last).to eq(nil)
  end
end
