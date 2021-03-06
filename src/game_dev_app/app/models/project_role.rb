class ProjectRole < ApplicationRecord
  belongs_to :project
  belongs_to :expertise
  has_one :member
  has_many :offers
  validates :expertise_id, :description, presence: true
  def role_title
    return "#{project.title} - #{expertise.title}"
  end
end
