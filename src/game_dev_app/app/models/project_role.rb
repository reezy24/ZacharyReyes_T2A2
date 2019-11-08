class ProjectRole < ApplicationRecord
  belongs_to :project
  belongs_to :expertise
  belongs_to :member
  has_many :offers
  validates :expertise_id, :project_id, :description, presence: true
end
