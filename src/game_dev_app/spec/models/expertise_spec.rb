require 'rails_helper'

RSpec.describe Expertise, type: :model do
  it "successfully creates an expertise with specified title" do
    Expertise.create(title: "Programmer")
    expect(Expertise.last.title).to eq("Programmer")
  end
  it "attempts to create an expertise with invalid params" do
    @expertise = Expertise.create(title: nil)
    expect(@expertise.title).to eq(nil)
    expect(Expertise.last).to eq(nil)
  end
end
