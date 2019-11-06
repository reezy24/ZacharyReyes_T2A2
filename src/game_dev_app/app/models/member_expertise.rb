class MemberExpertise < ApplicationRecord
  belongs_to :member
  has_one :expertise
  validates :member, :expertise, presence: true
end
