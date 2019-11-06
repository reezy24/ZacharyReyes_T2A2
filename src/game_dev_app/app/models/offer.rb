class Offer < ApplicationRecord
  belongs_to :project
  belongs_to :sender, :class_name => 'Member'
  belongs_to :receiver, :class_name => 'Member'
  validates :project_id, :sender_id, :receiver_id, :description, presence: true
  # validate that response is a boolean
  # validate associations
  validates_associated :project, :sender, :receiver
end