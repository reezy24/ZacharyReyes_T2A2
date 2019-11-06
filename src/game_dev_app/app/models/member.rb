class Member < ApplicationRecord

    # offer is where this member is on receiving end
    has_many :offers, :class_name => 'Offer', :foreign_key => 'receiver_id'

    # request is where this member is the sender
    has_many :requests, :class_name => 'Offer', :foreign_key => 'sender_id'

    has_many :expertises, through: :member_expertise
    has_many :projects, :class_name => 'Project', :foreign_key => 'owner_id'

    validates :first_name, :last_name, :about_me, presence: true
    # names should be only letters
    
end
