class Project < ApplicationRecord
  belongs_to :owner, :class_name => 'Member'
  has_many :project_roles, dependent: :destroy
  validates :owner, :title, :description, :duration, :budget, presence: true
  validates :budget, numericality: { only_integer: true }
end
