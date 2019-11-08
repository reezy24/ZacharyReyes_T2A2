class Expertise < ApplicationRecord
    has_many :member_expertises
    has_many :members, through: :member_expertises
    validates :title, presence: true
end
