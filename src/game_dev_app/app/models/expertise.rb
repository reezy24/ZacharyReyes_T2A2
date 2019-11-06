class Expertise < ApplicationRecord
    has_many :members, through: :member_expertise
    validates :title, presence: true
end
