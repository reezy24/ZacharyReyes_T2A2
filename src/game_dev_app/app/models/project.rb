class Project < ApplicationRecord
  belongs_to :owner, :class_name => 'Member'
  has_many :project_roles, dependent: :destroy
  accepts_nested_attributes_for :project_roles, allow_destroy: true
  has_many :offers
  validates :owner, :title, :description, :duration, :budget, presence: true
  validates :budget, numericality: { only_integer: true }
end
