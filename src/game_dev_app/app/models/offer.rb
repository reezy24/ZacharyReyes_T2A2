class Offer < ApplicationRecord
  belongs_to :sender, :class_name => 'Member'
  belongs_to :receiver, :class_name => 'Member'
  belongs_to :project_role
  validates :project_role_id, :sender_id, :receiver_id, :description, presence: true
  # validate that response is a boolean
  # validate associations
  validates_associated :project_role, :sender, :receiver
end