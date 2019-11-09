class MyDashboardController < ApplicationController
  before_action :authenticate_member!
  def projects

    # get all owned projects where owner matches current member
    @owned_projects = Project.where(owner: current_member)
    
    # get all involved projects by first finding all of the 
    # member's project roles and then matching the project id to
    # the corresponding project
    @involved_projects = []
    project_roles = ProjectRole.where(member_id: current_member.id)
    project_roles.each do |pr|
      @involved_projects << pr.project
    end
    p "member id: #{current_member.id}"
    @projects = @owned_projects + @involved_projects

  end

  def offers
    # when someone is asking you to work on their project
    @offers = Offer.where(receiver: current_member) 
  end

  def proposals
    # you ask someone if you can work on their project
    @pending = Offer.where(
      # commented code is my failed attempt at writing sql
      # "sender_id = :current_member AND project.owner_id != :current_member", 
      # {current_member: current_member.id}
      sender: current_member,
      response: nil,
    )
    @proposals = []
    @pending.each do |pend|
      @proposals << pend if pend.project_role.project.owner != current_member
    end
  end

  def profile
    if not current_member.profile_complete? then
      current_member.member_expertises.build
    end
  end

end
