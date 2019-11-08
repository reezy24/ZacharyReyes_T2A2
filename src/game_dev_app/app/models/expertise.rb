class Expertise < ApplicationRecord
    has_many :member_expertises
    has_many :members, through: :member_expertises
    has_many :project_roles
    validates :title, presence: true
end
