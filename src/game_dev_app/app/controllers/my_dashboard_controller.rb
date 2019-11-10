class MyDashboardController < ApplicationController
  before_action :authenticate_member!
  def projects

    # get all projects that this member owns
    @owned_projects = Project.where(owner: current_member)
    
    # get all roles that this member has
    @roles = current_member.project_roles

  end

  def offers
    # when someone is asking you to work on their project
    @offers = []
    Offer.where(receiver: current_member).each do |offer|
      @offers << offer if offer.project_role.project.owner != current_member
    end
  end

  def proposals
    # you ask someone if you can work on their project
    @proposals = []
    Offer.where(sender: current_member, response: nil).each do |pend|
      @proposals << pend if pend.project_role.project.owner != current_member
    end
  end

  def profile
    if not current_member.profile_complete? then
      current_member.member_expertises.build
    end
  end

end
