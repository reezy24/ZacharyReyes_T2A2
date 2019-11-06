require 'rails_helper'

RSpec.describe MemberExpertise, type: :model do
  it "successfully adds an expertise to a member model" do
    Member.create(
      first_name: "Zach",
      last_name: "Reyes",
      about_me: "I like to code."
    )
    Expertise.create(
      title: "Programmer"
    )
    MemberExpertise.create(
      member_id: Member.last.id,
      expertise_id: Expertise.last.id,
    )
    expect(MemberExpertise.last.member_id).to eq(Member.last.id)
    expect(MemberExpertise.last.expertise_id).to eq(Expertise.last.id)
  end
  it "attempts to add nil as an expertise to a member model" do
    Member.create(
      first_name: "Zach",
      last_name: "Reyes",
      about_me: "I like to code."
    )
    @member_expertise = MemberExpertise.create(
      member_id: Member.last.id,
      expertise_id: nil,
    )
    expect(@member_expertise.member_id).to eq(Member.last.id)
    expect(@member_expertise.expertise_id).to eq(nil)
    expect(MemberExpertise.last).to eq(nil)
  end
end
