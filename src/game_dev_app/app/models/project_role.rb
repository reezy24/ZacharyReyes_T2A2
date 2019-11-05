class ProjectRole < ApplicationRecord
  belongs_to :expertise
  belongs_to :project
  belongs_to :member
end
