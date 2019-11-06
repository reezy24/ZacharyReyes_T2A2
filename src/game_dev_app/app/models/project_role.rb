class ProjectRole < ApplicationRecord
  belongs_to :expertise
  belongs_to :project
  has_one :member
  validates :expertise_id, :project_id, :description, presence: true
end
