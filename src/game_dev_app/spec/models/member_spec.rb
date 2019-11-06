require 'rails_helper'

RSpec.describe Member, type: :model do
  it "successfully creates a member" do
    @member = Member.create(first_name: "Zach", last_name: "Reyes", about_me: "I like to code.")
    expect(@member.first_name).to eq("Zach")
    expect(@member.last_name).to eq("Reyes")
    expect(@member.about_me).to eq("I like to code.")
  end
end
