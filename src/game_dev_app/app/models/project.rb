class Project < ApplicationRecord
  belongs_to :owner, :class_name => 'Member'

  validates :owner, :title, :description, :duration, :budget, presence: true
  validates :budget, numericality: { only_integer: true }
end
