class MyDashboardController < ApplicationController
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
    @offers = Offer.where(receiver: current_member)
  end

  def proposals
  end

  def profile
  end
end
