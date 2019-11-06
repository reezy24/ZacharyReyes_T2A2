class MemberExpertise < ApplicationRecord
  belongs_to :member
  belongs_to :expertise
  validates :member, :expertise, presence: true
end
