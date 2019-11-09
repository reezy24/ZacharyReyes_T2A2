class ProjectDashboardController < ApplicationController
  before_action :set_proj
  def edit
  end

  def members
    @members = []
    @project.project_roles.where(member: true) do |role|
      p role
      @members << role.member
    end
  end

  def requests
    # you ask someone if you can work on their project
    @pending = Offer.where(
      # commented code is my failed attempt at writing sql
      # "sender_id = :current_member AND project.owner_id != :current_member", 
      # {current_member: current_member.id}
      sender: current_member,
      response: nil,
    )
    @requests = []
    @pending.each do |pend|
      @requests << pend if pend.project_role.project.owner == current_member
    end
  end

  private
  def proj_params
    params.permit(:id)
  end
  def set_proj
    @project = Project.find(proj_params[:id])
  end
end
