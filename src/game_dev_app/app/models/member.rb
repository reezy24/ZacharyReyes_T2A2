class Member < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

    has_many :member_expertises
    has_many :expertises, through: :member_expertises, dependent: :destroy
    accepts_nested_attributes_for :member_expertises, allow_destroy: true
    has_many :project_roles
    # offer is where this member is on receiving end
    has_many :offers, :class_name => 'Offer', :foreign_key => 'receiver_id'
    # request is where this member is the sender
    has_many :requests, :class_name => 'Offer', :foreign_key => 'sender_id'
    has_many :projects, :class_name => 'Project', :foreign_key => 'owner_id'
    
    #validates :first_name, :last_name, :about_me, presence: true
    # names should be only letters
    
    def full_name
      return "#{self.first_name} #{self.last_name}"
    end

    def profile_complete?
      return (self.first_name and self.last_name and self.about_me)
    end
end
